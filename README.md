# pymc-docker
Docker for PyMC version 4.0.0 run on CPUs or GPUs

## 1. Install docker image

You can either pull docker image from [docker hub](https://hub.docker.com/u/danhphan) or build it from docker file at [this repo](https://github.com/danhphan/pymc-docker/).
#### 1.1. Pull image from docker hub
```
# Use PyMC docker image with CPUs
docker pull danhphan/pymc:4.0.0
# Use PyMC docker image with GPUs
docker pull danhphan/pymc-gpu:4.0.0
```

#### 1.2. Build image from dockerfile
```
clone git@github.com:danhphan/pymc-docker.git
cd pymc-docker
# Build docker image with CPUs
docker build -t pymc:4.0.0 .
# Build docker image with GPUs
docker build -t pymc-gpu:4.0.0 -f ./Dockerfile.gpu .
```

## 2. How to run

You can run the docker container from `jupyter notebook` or from `bash`.

#### 2.1. Run with Jupyter notebook
```
cd to_your_working_folder
# Run docker container with CPUs
docker run -it -p 8888:8888 -v "$(pwd)":/home/jovyan/workspace --rm  pymc:4.0.0
# Run docker container with GPUs
docker run -it --gpus all -p 8888:8888 -v "$(pwd)":/workspace --rm  pymc-gpu:4.0.0
```

#### 2.2 Run with command lines
```
cd to_your_working_folder
# Run docker container with CPUs
docker run -it -v "$(pwd)":/home/jovyan/workspace --rm pymc:4.0.0 bash
# Run docker container with GPUs
docker run -it --gpus all -v "$(pwd)":/workspace --rm pymc-gpu:4.0.0 bash
```