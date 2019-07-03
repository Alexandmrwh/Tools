#FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu16.04
FROM pytorch/pytorch

RUN useradd -rm -d /home/wuhan -s /bin/bash -g root -G sudo -u 1005 wuhan
USER wuhan
WORKDIR /home/wuhan
