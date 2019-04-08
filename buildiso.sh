#!/bin/bash

echo -e "\033[1;32;40mexport env vars\033[0m"

export OS_YAML1="/usr/share/openstack-tripleo-common/image-yaml/overcloud-images.yaml"
export OS_YAML2="/usr/share/openstack-tripleo-common/image-yaml/overcloud-images-centos7.yaml"
export DIB_LOCAL_IMAGE="/root/.cache/image-create/CentOS-7-x86_64-GenericCloud-1811.qcow2.xz"
export DIB_YUM_REPO_CONF="/etc/yum.repos.d/delorean*"
export DIB_YUM_REPO_CONF="$DIB_YUM_REPO_CONF /etc/yum.repos.d/tripleo-centos-ceph-luminous.repo"

echo -e "\033[1;31;40mbuild overcloud-full and ironic-python-agent images by the diskimage-builder...\033[0m"

openstack overcloud image build --config-file $OS_YAML1 --config-file $OS_YAML2

echo -e "\033[1;31;40mimages is build done\033[0m"
