# pymc-docker
Docker for PyMC version 4 run on CPU and GPU


## Install docker image
```
clone git@github.com:danhphan/pymc-docker.git
cd pymc-docker
docker build -t pymc:v4.0 .
```

## How to run

### Run with Jupyter notebook
```
cd to_your_working_folder
docker run -it -p 8888:8888 -v "$(pwd)":/home/jovyan --rm  pymc:v4.0
```
### Run with command lines
```
cd to_your_working_folder
docker run -it -v "$(pwd)":/home/jovyan --rm pymc:v4.0 bash
```
