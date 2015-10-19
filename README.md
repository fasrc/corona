# CORONA
###### Disclaimer: This is a completely experimental project.  We are still at the very early stages of developing CORONA

CORONA is a containerized OpenNebula deployment.  The primary goal is to build a OpenNebula deployment which can easily be rolled out or rolled back.  At the moment the plan is to split the services into 3 containers libvirt, onenode, and oneserver.

##Requirements

The newest version of docker is suggest although this is tested with docker 1.8.2.  The newest version can be installed using:

```
curl -sSL https://get.docker.io | bash
```

Docker compose is also suggested. The easiest way to install docker compose is a pip install

```
pip install -U docker-compose
```

##Deployments
###### Disclaimer: At the moment these are based on the OpenNebula quick start guild.  More advanced configurations will follow

####Hybrid

The hybrid deployment is one host which contains both the controller software and a hypervisor.  In this deployment the controller container is lanched first and all other containers mount the controllers `/var/lib/one`.  The nfs container is used the export all of `/var/lib/one/`, although this can be set using the `/opt/corona/nfs/nfs_export` configuration file.  The nfs container is only necessary if other nodes are going to be attached to this deployment.

#####Quick Setup:


To start all the containers run:

```
docker-compose -f compose/one-hybrid.yml up
```

This will deploy OpenNebula without sunstone.  Sunstone will come in it's own container in the future.  It is possible to start the default sunstone in the one-controller container manually but it's not recommended for anything but testing.

At the moment the controller is not configured to accept commands from the host (This should be fixed soon).  In order to add a host first enter the container using

```
docker exec -ti compose_one-controller_1 /bin/bash
```

Once in the container the OpenNebula CLI commands should work.  To add the local host as a hypervisor run:

```
onehost create localhost -i kvm -v kvm -n dummy
```

I had some issue with the ssh authorized_keys file until this is fixed make sure

```
chmod 700 /var/lib/one/.ssh
chmod 600 /var/lib/one/.ssh/authorized_keys
```

This should alleviate any ssh comunication errors.

######Adding A Hypervisor Node:

Log into your additional hypervisor and run

```
docker-compose -f compose/one-hypervisor.yml up
```

In order to mount the nfs export from the controller node you will have to enter the nfs container.  This will also be fixed in the future.

```
docker exec -ti compose_one-nfs_1 /bin/bash
```

Once in the nfs container either append the fstab to include your controller export.  This can be a bit trick and should be revisited soon.

To add the node run the onehost create command with the ip address or host name of the new hypervisor.
This needs some more work.