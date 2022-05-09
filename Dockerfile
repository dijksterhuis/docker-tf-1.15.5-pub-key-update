FROM tensorflow/tensorflow:1.15.5-gpu-py3 as base

RUN apt-key adv \
 --fetch-keys \
 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub

RUN apt update -qq \
 && apt clean \
 && rm -rf /var/lib/apt/lists/* \
 && apt autoremove -yqq

