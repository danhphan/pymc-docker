#! /bin/bash

docker run -it --name pymc:v4.0 --net=host -v "$(pwd)":/home/jovyan