# CORONA
###### Disclaimer: This is a completely experimental project.  We are still at the very early stages of developing CORONA

CORONA is a containerized OpenNebula deployment.  The primary goal is to build a OpenNebula deployment which can easily be rolled out or rolled back.  At the moment the plan is to split the services into 3 containers libvirt, onenode, and oneserver.

##Requirements

The newest version of docker is suggest although this is tested with docker 1.8.2.  The newest version can be installed using:

```
curl -sSL https://get.docker.io | bash
```

##Compose

Compose deployment requires docker-compose.  Download using:

```
pip install -U docker-compose
```

To start libvirt run

```
docker-compose -f compose/one-hypervisor.yml up
```

##Manual
#### Libvirt

To start libvirt manually run

```
docker run --rm --privileged=true -ti -v /var/run:/var/run -v /dev:/dev --net=host -v /sys/fs/cgroup:/sys/fs/cgroup --pid=host --name=libvirt corona/libvirt
```

If libvirt client is not installed on the host.  Libvirt container testing can be done with the below command.

```
docker exec -ti [Container ID] virsh list
```