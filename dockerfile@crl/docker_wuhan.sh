#!/bin/bash
set -x

DOCKER_FLAG="-idt"
DOCKER_PRIV="--privileged=true"
DOCKER_DEVICES="--device /dev/nvidia0:/dev/nvidia0 --device /dev/nvidia1:/dev/nvidia1 --device /dev/nvidiactl:/dev/nvidiactl --device /dev/nvidia-uvm:/dev/nvidia-uvm"

# for MPS sharing
DOCKER_DISK="-v /var/nvidia-driver:/usr/local/nvidia:rw"
#DOCKER_DISK="-v /dev/shm:/dev/shm"

PERSONAL_DISK="-v /home/wuhan:/home/wuhan:rw"
# WORK_DIR='-w /home/wuhan'

DOCKER_NAME="--name wuhan-torch-dev"

#DOCKER_NET="--net host"
#DOCKER_PORT="-p 5000:5001"

DOCKER_IMAGE="pytorch:dev"
#DOCKER_IMAGE="nvidia/cuda:8.0-cudnn7-devel-ubuntu16.04"
#DOCKER_IMAGE="nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04"
#DOCKER_IMAGE="nvidia/cuda:10.1-cudnn7-devel-ubuntu16.04"
#DOCKER_COMMAND="/opinit"
DOCKER_COMMAND="/bin/bash"
docker run $DOCKER_FLAG $DOCKER_PRIV $DOCKER_DEVICES $DOCKER_NET $WORK_DIR $DOCKER_DISK $PERSONAL_DISK $DOCKER_DNS $DOCKER_NAME $DOCKER_PORT $DOCKER_IMAGE $DOCKER_COMMAND
