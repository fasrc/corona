import os
import re
import sys
import shutil
import tempfile

import jinja2
from OpenSSL import crypto

from sh import httpd


REQUIRED = [
    'SERVER_NAME',
]

TEMPLATES = [
    'sunstone.conf.j2',
    'http-to-https.conf.j2',
    'onegate-proxy.conf.j2',
    'xmlrpc-proxy.conf.j2',
]

CERTS = [
    ('/etc/pki/tls/certs/sunstone.cer', "/etc/pki/tls/private/sunstone.key"),
    ('/etc/pki/tls/certs/xmlrpc.cer', '/etc/pki/tls/private/xmlrpc.key'),
    ('/etc/pki/tls/certs/onegate.cer', "/etc/pki/tls/private/onegate.key"),
]


def get_self_signed_cert(server_name):
    key = crypto.PKey()
    key.generate_key(crypto.TYPE_RSA, 2048)

    cert = crypto.X509()
    cert.get_subject().C = "US"
    cert.get_subject().ST = "Somestate"
    cert.get_subject().L = "Somecity"
    cert.get_subject().O = "Some company"
    cert.get_subject().OU = "Some organization"
    cert.get_subject().CN = server_name
    cert.set_serial_number(1000)
    cert.gmtime_adj_notBefore(0)
    cert.gmtime_adj_notAfter(10 * 365 * 24 * 60 * 60)
    cert.set_issuer(cert.get_subject())
    cert.set_pubkey(key)
    cert.sign(key, 'sha256')
    return cert, key


def write_cert(cert, key, cert_dest, key_dest):
    with open(cert_dest, "wt") as f:
        f.write(crypto.dump_certificate(crypto.FILETYPE_PEM, cert))
    with open(key_dest, "wt") as f:
        f.write(crypto.dump_privatekey(crypto.FILETYPE_PEM, key))


def check_certs(ctx):
    sscert = None
    for cert, key in CERTS:
        if not os.path.exists(cert) and not os.path.exists(key):
            sscert = sscert or get_self_signed_cert(ctx['SERVER_NAME'])
            write_cert(sscert[0], sscert[1], cert, key)


def install_configs(ctx):
    j2env = jinja2.Environment(loader=jinja2.PackageLoader('corona_sunstone'))

    for template in TEMPLATES:
        tmpl = j2env.get_template(template)
        dest = '/etc/httpd/conf.d/{}'.format(template.strip('.j2'))
        with open(dest, 'w') as f:
            f.write(tmpl.render(ctx))

    with open('/etc/httpd/conf.d/servername.conf', 'w') as f:
        f.write('ServerName {}:443'.format(ctx['SERVER_NAME']))


def sed_inplace(filename, pattern, repl):
    """
    Perform the pure-Python equivalent of in-place `sed` substitution: e.g.,
    `sed -i -e 's/'${pattern}'/'${repl}' "${filename}"`.
    """
    pattern_compiled = re.compile(pattern)

    with tempfile.NamedTemporaryFile(mode='w', delete=False) as tmp_file:
        with open(filename) as src_file:
            for line in src_file:
                tmp_file.write(pattern_compiled.sub(repl, line))

    shutil.copystat(filename, tmp_file.name)
    shutil.move(tmp_file.name, filename)


def configure_vnc_wss(ctx):
    sed_inplace(
        '/etc/one/sunstone-server.conf',
        r'^:vnc_proxy_support_wss:.*$',
        r':vnc_proxy_support_wss: "{}"'.format(ctx['VNC_PROXY_SUPPORT_WSS']),
    )


def get_ctx():
    ctx = {
        'ONEGATE_HOST': 'localhost',
        'ONEGATE_PORT': 5030,
        'ONE_XMLRPC_HOST': 'localhost',
        'ONE_XMLRPC_PORT': 2633,
        'VNC_PROXY_SUPPORT_WSS': 'yes',
    }
    ctx.update(os.environ)
    missing = '\n'.join([' - {}'.format(r) for r in REQUIRED if r not in ctx])
    if missing:
        sys.stderr.write(
            "Missing required environment variable(s):\n\n{}\n".format(missing)
        )
        exit(1)
    return ctx


def main():
    ctx = get_ctx()
    configure_vnc_wss(ctx)
    install_configs(ctx)
    check_certs(ctx)
    exit(httpd(["-DFOREGROUND"], _fg=True).exit_code)
