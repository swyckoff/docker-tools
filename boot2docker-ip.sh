#!/bin/bash

. color-logging.bash

info "Start boot2docker and add 'dockerhost' to your /etc/hosts"

[[ $(boot2docker status) != "running" ]] && boot2docker up

eval $(boot2docker shellinit 2> /dev/null)

if [[ -z $(cat /etc/hosts | grep docker) ]]; then
  echo $(boot2docker ip 2> /dev/null) dockerhost | sudo tee -a /etc/hosts
fi
