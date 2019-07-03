FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu16.04

# Install some basic utilities
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    vim wget curl dnsutils\
    python3 python3-pip postgresql-client \
    apt-transport-https iputils-ping graphviz \
    ca-certificates \
    sudo git bzip2 libx11-6 && \
    pip3 install --upgrade pip && \
    rm -rf /var/lib/apt/lists/*

# Install Requests, a Python library for making HTTP requests
RUN pip3 install requests setuptools

# Install HDF5 Python bindings
RUN pip3 install h5py h5py-cache

# Install OpenCV3 Python bindings
RUN sudo apt-get update && sudo apt-get install -y --no-install-recommends \
    libgtk2.0-0 \
    libcanberra-gtk-module \
    && sudo rm -rf /var/lib/apt/lists/*

RUN pip3 install opencv-python

# Install Torchnet, a high-level framework for PyTorch
RUN pip3 install torchnet

# CUDA 10.0-specific steps
RUN pip3 install torch torchvision

# Set the default command to python3
CMD ["python3"]
