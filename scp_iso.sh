#!/bin/bash

remote_ip=10.200.2.160
echo -e "\033[1;32;40mtar ironic-python-agent.tar\033[0m"
tar -zcvf ironic-python-agent.tar ironic-python-agent.initramfs ironic-python-agent.kernel

echo -e "\033[1;32;40mtar overcloud-full.tar\033[0m"
tar -zcvf overcloud-full.tar overcloud-full.initrd overcloud-full.qcow2 overcloud-full.vmlinuz

echo -e "\033[1;32;40mtar iso done.\033[0m"
scp ./*.tar root@$remote_ip:/images

echo -e "\033[1;32;40mclean current dir iso file\033[0m"
rm -rf ./ironic* && rm -rf overcloud*

ssh root@$remote_ip "sh /images/md5sum_iso.sh"

if [ `echo $?` -eq 0 ]; then

    echo -e "\033[1;32;40m==========done===========\033[0m"
else
    echo -e "\033[1;31;40m==========error==========\033[0m"
fi
