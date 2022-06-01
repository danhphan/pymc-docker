FROM jupyter/base-notebook

LABEL name="pymc"
LABEL version="4.0"
LABEL description="Environment for PyMC version 4"

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
    python3-pip \
    python3-dev \
    # ---- nbconvert dependencies ----
    texlive-xetex \
    texlive-fonts-recommended \
    texlive-plain-generic \
    # ----
    rsync \
    software-properties-common \
    unzip \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get install python3.9

# Open Ports for Jupyter
EXPOSE 8888

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID

RUN python3 -m pip install --upgrade pip setuptools wheel

COPY requirements.txt .
RUN pip3 install -r requirements.txt && conda install python-graphviz


CMD ["jupyter", "notebook", "--allow-root", "--ip=0.0.0.0"]
