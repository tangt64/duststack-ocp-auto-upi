#platform=x86, AMD64, or Intel EM64T
#version=DEVEL
# Install OS instead of upgrade
install
# Keyboard layouts
keyboard 'us'
# Root password
rootpw --iscrypted $1$AIubiWJF$vK5w3CUO9py7vkhmEkMb3/
# Use network installation
url --url="{{ rhel7_mirror_url }}"
# System language
lang en_US
# System authorization information
auth  --useshadow  --passalgo=sha512
# Use text mode install
text
firstboot --disable
# SELinux configuration
selinux --disabled
# Firewall configuration
#firewall --disabled
# Do not configure the X Window System
skipx

# Network information
network  --bootproto=static --device=eth0 --gateway=192.168.133.1 --ip=192.168.133.250 --nameserver="{{ libvirtd_dns_server }}" --netmask=255.255.255.0 --hostname=lb.ocp.example.com 
network  --bootproto=static --device=eth1 --ip=192.168.80.250 --netmask=255.255.255.0 
# Reboot after installation
reboot
# System timezone
timezone Asia/Seoul
# System bootloader configuration
bootloader --location=mbr
# Clear the Master Boot Record
zerombr
# Partition clearing information
clearpart --all
# Disk partitioning information
part / --asprimary --fstype="xfs" --size=50000

%post
yum install haproxy -y
semanage port -a -t http_port_t -p tcp 6443
semanage port -a -t http_port_t -p tcp 22623
firewall-cmd --add-port 6443/tcp --permanent
firewall-cmd --add-port 22623/tcp --permanent
firewall-cmd --add-port 9000/tcp --permanent
systemctl enable haproxy
%end
