# pymc-docker
Docker for PyMC version 4.0.0 run on CPU and GPU


## 1. Install docker image

You can either pull docker image from [docker hub](https://hub.docker.com/u/danhphan) or build it from docker file at [this repo](https://github.com/danhphan/pymc-docker/).
### 1.1. Pull image from docker hub
```
# Use CPU image
docker pull danhphan/pymc:4.0.0
# Use GPU image
docker pull danhphan/pymc-gpu:4.0.0
```

#### 1.2. Build from dockerfile
```
clone git@github.com:danhphan/pymc-docker.git
cd pymc-docker
# Build CPU image
docker build -t pymc:4.0.0 .
# Build GPU image
docker build -t pymc-gpu:4.0.0 -f ./Dockerfile.gpu .
```

## 2. How to run

#### 2.1. Run with Jupyter notebook
```
cd to_your_working_folder
# Run with CPU
docker run -it -p 8888:8888 -v "$(pwd)":/home/jovyan --rm  pymc:4.0.0
# Run with GPU
docker run -it --gpus all -p 8888:8888 -v "$(pwd)":/home/jovyan --rm  pymc-gpu:4.0.0
```


#### 2.2 Run with command lines
```
cd to_your_working_folder
# Run with CPU
docker run -it -v "$(pwd)":/home/jovyan --rm pymc:4.0.0 bash
# Run with GPU
docker run -it --gpus all -v "$(pwd)":/home/jovyan --rm pymc-gpu:4.0.0 bash
```