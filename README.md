# pymc-docker
Docker for PyMC version 4 run on CPU and GPU


## 1. Install docker image

### 1.1. Pull image from docker hub
```
docker pull danhphan/pymc:v4.0.0b6
```

#### 1.2. Build from dockerfile
```
clone git@github.com:danhphan/pymc-docker.git
cd pymc-docker
docker build -t pymc:v4.0.0b6 .
```

## 2. How to run

#### 2.1. Run with Jupyter notebook
```
cd to_your_working_folder
docker run -it -p 8888:8888 -v "$(pwd)":/home/jovyan --rm  pymc:v4.0.0b6
```
#### 2.2 Run with command lines
```
cd to_your_working_folder
docker run -it -v "$(pwd)":/home/jovyan --rm pymc:v4.0.0b6 bash
```
