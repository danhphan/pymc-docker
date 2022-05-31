#! /bin/bash
docker run -it -p 8888:8888 -v "$(pwd)":/home/jovyan --rm  pymc:v4.0


