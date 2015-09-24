#Libvirt Testing Documentation

This testing assumes virt-install in already on the host.  If it can be obtained using

```
yum install -y virt-install
```

Make sure /dev/pts/ptmx is 666.  Some investigation on why this happens is needed

```
mkdir -p /var/lib/libvirt/images

docker run --rm --privileged=true -ti -v /var/run:/var/run -v /dev:/dev --net=host -v /sys/fs/cgroup:/sys/fs/cgroup -v /var/lib/libvirt/images:/var/lib/libvirt/images -v /lib/modules:/lib/modules:ro --pid=host --name=libvirt corona/libvirt

dd if=/dev/zero of=/var/lib/libvirt/images/guest.img bs=1M count=8192

curl -o /var/lib/libvirt/images/Centos7.iso http://isoredirect.centos.org/centos/7/isos/x86_64/CentOS-7-x86_64-Minimal-1503-01.iso

virt-install --connect qemu:///system -r 1024 --accelerate -n Fedora -f /var/lib/libvirt/images/guest.img --cdrom /var/lib/libvirt/images/Centos7.iso --noautoconsole --virt-type kvm --vnc --console pty,target_type=virtio
```