FROM jupyter/minimal-notebook:python-3.9.5

LABEL name="pymc"
LABEL version="4.0.0b6"
LABEL description="Environment for PyMC version 4.0.0b6"

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

USER root

RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 \
    libxext6 \
    libsm6 \
    libxrender1 \
    git-core git mercurial subversion \
    build-essential \
    byobu \
    curl \
    htop \
    libcupti-dev \
    libfreetype6-dev \
    libzmq3-dev \
    pkg-config \
    rsync \
    software-properties-common \
    unzip \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# RUN apt-get install python3.9

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID

COPY environment-dev.yml .
RUN mamba env create -f environment-dev.yml \
    && conda clean --all -f -y

# Give bash access to Anaconda
RUN echo "source activate pymc-dev" >> ~/.bashrc && \
    source ~/.bashrc

RUN /bin/bash -c ". activate pymc-dev && \
    pip install --upgrade pip && \ 
    pip install git+https://github.com/pymc-devs/pymc.git"

SHELL ["/bin/bash","-c"]
RUN conda init
RUN echo 'conda activate pymc-dev' >> ~/.bashrc

EXPOSE 8888

CMD ["conda", "run", "--no-capture-output", "-n", "pymc-dev", "jupyter","notebook","--ip=0.0.0.0","--port=8888","--no-browser","--allow-root"]
