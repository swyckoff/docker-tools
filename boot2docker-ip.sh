#!/bin/bash

set -e

. color-logger.bash

hash boot2docker > /dev/null 2>&1 || { error "Please install boot2docker to use this script" ; exit 1; }

info "Start boot2docker and add 'boot2docker' to your '/etc/hosts'"
info "This works because boot2docker generates certificates necessary for a 'boot2docker' host to use with TLS"

[[ $(boot2docker status) != "running" ]] && boot2docker up

$(boot2docker shellinit 2> /dev/null)

if [[ -z $(cat /etc/hosts | grep docker) ]]; then
  echo $(boot2docker ip 2> /dev/null) boot2docker| sudo tee -a /etc/hosts
fi
