#!/bin/bash

# Install Ansible  version: 2.9.27
SOFTVERSION="2.9.27"

function INSTALL_ANSIBLE(){
	mkdir ansible-${SOFTVERSION}
	[[ -f "./ansible-${SOFTVERSION}.tar" ]] && tar zxf ansible-${SOFTVERSION}.tar -C ansible-${SOFTVERSION}
	rpm -Uvh --force --nodeps ansible-${SOFTVERSION}/*rpm
}


