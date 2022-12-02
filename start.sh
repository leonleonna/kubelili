#!/bin/bash
source /etc/rc.d/init.d/functions
[[ ${UID} != 0 ]] && exit 1

# 安装Ansible
rpm -qa | grep ansible && [[ $? -eq 1 ]] && sh ./pkg/ansible/install.sh 

# 确认主机信息及角色
function HOSTMSG(){
    ansible 

}
