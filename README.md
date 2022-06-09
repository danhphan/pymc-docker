# pymc-docker
Docker for PyMC version 4.0.0 run on CPU and GPU


## 1. Install docker image

### 1.1. Pull image from docker hub
```
docker pull danhphan/pymc:4.0.0
```

#### 1.2. Build from dockerfile
```
clone git@github.com:danhphan/pymc-docker.git
cd pymc-docker
docker build -t pymc:4.0.0 .
```

Build container with GPUs support
```
docker build -t pymc-gpu:4.0.0 -f ./Dockerfile.gpu .
```

## 2. How to run

#### 2.1. Run with Jupyter notebook
```
cd to_your_working_folder
docker run -it -p 8888:8888 -v "$(pwd)":/home/jovyan --rm  pymc:4.0.0
```

Run with GPUs
```
docker run -it --gpus all -p 8888:8888 -v "$(pwd)":/home/jovyan --rm  pymc-gpu:4.0.0
```

#### 2.2 Run with command lines
```
cd to_your_working_folder
docker run -it -v "$(pwd)":/home/jovyan --rm pymc:4.0.0 bash
```

Run with GPUs
```
docker run -it --gpus all -v "$(pwd)":/home/jovyan --rm pymc-gpu:4.0.0 bash
```
