import os
import sys

import jinja2

from sh import httpd

REQUIRED = [
    'SERVER_NAME',
]


def install_configs():
    ctx = {
        'ONEGATE_HOST': 'localhost',
        'ONEGATE_PORT': 5030,
        'ONE_XMLRPC_HOST': 'localhost',
        'ONE_XMLRPC_PORT': 2633,
    }
    ctx.update(os.environ)
    missing = '\n'.join([' - {}'.format(r) for r in REQUIRED if r not in ctx])
    if missing:
        sys.stderr.write(
            "Missing required environment variable(s):\n\n{}\n".format(missing)
        )
        exit(1)

    j2env = jinja2.Environment(loader=jinja2.PackageLoader('corona_sunstone'))

    templates = [
        'sunstone.conf.j2',
        'http-to-https.conf.j2',
        'onegate-proxy.conf.j2',
        'xmlrpc-proxy.conf.j2',
    ]

    for template in templates:
        tmpl = j2env.get_template(template)
        dest = '/etc/httpd/conf.d/{}'.format(template.strip('.j2'))
        with open(dest, 'w') as f:
            f.write(tmpl.render(ctx))


def main():
    install_configs()
    exit(httpd(["-DFOREGROUND"], _fg=True).exit_code)
