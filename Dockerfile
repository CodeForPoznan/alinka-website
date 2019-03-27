FROM python:3.6-slim

ENV NODE_VERSION 10.14.1
ENV NVM_DIR /usr/local/nvm
ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH
ENV USER_DIR="/root"
ARG USER_ID

WORKDIR /workspace

RUN apt-get update && apt-get install -y \
    wget vim-tiny \
    && rm -rf /var/lib/apt/lists/*

RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash

RUN . $NVM_DIR/nvm.sh && \
    nvm install $NODE_VERSION && \
    nvm alias default $NODE_VERSION && \
    nvm use default

COPY requirements.txt package.json /workspace/

RUN pip install -r requirements.txt

RUN npm install \
    && pip install -U pip==19.0.3 \
    && pip install -r requirements.txt

RUN adduser --shell /bin/bash --disabled-password --gecos "" --uid $USER_ID code4poznan \
    && chown -R code4poznan /workspace
USER code4poznan

COPY . /workspace

ENTRYPOINT bash docker_entrypoint.sh