# CORONA - COntaineRized OpenNebulA

###### DISCLAIMER: This project is currently experimental and not yet ready for production use.

CORONA provides a collection of containers for deploying OpenNebula clusters.
The goal is to make it easy to deploy, upgrade, and downgrade OpenNebula.

## Requirements

- docker
- docker-compose (optional)

The docker-compose package is not strictly required, however, CORONA ships with
compose files that both serve as a point of reference for usage and can be used
out-of-the-box and tweaked for various deployments (e.g. hybrid/all-ine-one,
etc.)

## Deployments

#### Hybrid/All-in-One

**NOTE**: This is useful for development but not recommended for production.

The hybrid deployment launches all OpenNebula service containers and configures
a hypervisor on a single host. In this setup the controller container is
lanched first and all other containers mount the controllers `/var/lib/one` via
a docker volume.

##### Quick Start:

Clone the repo - in this example we'll use `$HOME/repos/corona`:

```
$ git clone https://github.com/fasrc/corona.git $HOME/repos/corona

```

Next copy or link the `/usr/local/corona/opt` directory to /opt/corona:

```
$ sudo cp -r $HOME/repos/corona/opt /opt/corona
```

or

```
$ sudo ln -s $HOME/repos/corona/opt /opt/corona
```

Configure `$SERVER_NAME` and `$ONE_VERSION` environment variables:

```
$ export ONE_VERSION="5.8"
$ export SERVER_NAME=$(hostname)
```

To start all containers run:

```
$ docker-compose -f compose/corona-hybrid.yml up
```

This will deploy a full OpenNebula stack on a single host including a
hypervisor.

```
$ docker-compose -f compose/corona-controller.yml up
```

The sunstone container listens on `https://$SERVER_NAME:443` by default. It
also generates and uses self-signed SSL certs by default unless the following
files are bind mounted at run time:

- /etc/pki/tls/certs/sunstone.cer
- /etc/pki/tls/private/sunstone.key
- /etc/pki/tls/certs/xmlrpc.cer
- /etc/pki/tls/private/xmlrpc.key
- /etc/pki/tls/certs/onegate.cer
- /etc/pki/tls/private/onegate.key

(typically these are all the same cert/key).

You should now be able to login to sunstone and use OpenNebula.

**NOTE**: You'll need to browse to and accept any SSL warnings on both
https://$SERVER_NAME:443 and https://$SERVER_NAME:29876 when using the default
self-signed SSL certs before attempting to use the noVNC interface in Sunstone.

Run the following to fetch the oneadmin credentials from the controller:

```
$ docker exec -it compose_controller_1 cat /var/lib/one/.one_auth
oneadmin:xxxxxxxxxxxxxxxx
```

You can also add the host as an OpenNebula hypervisor:

```
$ docker exec -ti corona_controller_1 /bin/bash
$ su - oneadmin
$ onehost create $(hostname) -i kvm -v kvm -n dummy
```
