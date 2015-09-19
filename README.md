# DockerNebula

To start libvirt manually run

```
docker run --rm --privileged=true -ti -v /var/run:/var/run -v /dev:/dev --net=host -v /sys/fs/cgroup:/sys/fs/cgroup --pid=host --name=libvirt dockernebula/libvirt
```

A libvirt example is

```
docker exec -ti [Container ID] virsh list
```

###Testing Documentation

Make sure /dev/pts/ptmx is 666.  Some investigation on why this happens is needed

```
mkdir -p /var/lib/libvirt/images

docker run --rm --privileged=true -ti -v /var/run:/var/run -v /dev:/dev --net=host -v /sys/fs/cgroup:/sys/fs/cgroup -v /var/lib/libvirt/images:/var/lib/libvirt/images --pid=host --name=libvirt dockernebula/libvirt

curl -o /var/lib/libvirt/images/fedora.qcow2 http://fedora.osuosl.org/linux/releases/20/Images/x86_64/Fedora-x86_64-20-20131211.1-sda.qcow2

virt-install --connect qemu:///system -r 1024 --accelerate -n Fedora -f /var/lib/libvirt/images/guest.img --cdrom /var/lib/libvirt/images/Fed22.iso --noautoconsole --virt-type kvm --vnc --console pty,target_type=virtio
```
