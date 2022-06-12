#! /bin/bash
docker run -it -p 8888:8888 -v "$(pwd)":/home/jovyan/workspace --rm  pymc:4.0.0


