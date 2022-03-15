#platform=x86, AMD64, 또는 Intel EM64T
#version=DEVEL
# Install OS instead of upgrade
install
# Keyboard layouts
keyboard 'us'
# Root password
rootpw --iscrypted $1$AIubiWJF$vK5w3CUO9py7vkhmEkMb3/
# System language
lang en_US
# System authorization information
auth  --useshadow  --passalgo=sha512
# Use text mode install
text
# SELinux configuration
selinux --disabled
# Do not configure the X Window System
skipx

# Firewall configuration
#firewall --disabled
# Network information
network  --bootproto=static --device=eth0 --gateway=192.168.133.1 --ip=192.168.133.2 --nameserver="{{ libvirtd_dns_server }}" --netmask=255.255.255.0 --hostname utility.ocp.example.com
network  --bootproto=static --device=eth1 --ip=192.168.80.2 --netmask=255.255.255.0
# Reboot after installation
reboot
# System timezone
timezone Asia/Seoul
# Use network installation
url --url="{{ rhel7_mirror_url }}"
# System bootloader configuration
bootloader --location=mbr
# Clear the Master Boot Record
zerombr
# Partition clearing information
clearpart --all --initlabel
# Disk partitioning information
part / --asprimary --fstype="xfs" --size=50000

%post

firewall-cmd --add-service=dns --permanent

systemctl enable --now named
systemctl enable --now httpd

firewall-cmd --add-service dns --permanent
firewall-cmd --add-service http --permanent
%end
