FROM node:10.14.1

ENV NODE_VERSION 10.14.1
ENV USER_DIR="/root"
ARG USER_ID

WORKDIR /workspace

RUN apt-get update && apt-get install -y \
    awscli wget vim-tiny \
    && rm -rf /var/lib/apt/lists/*

COPY package.json package-lock.json /workspace/

RUN npm install

RUN adduser --shell /bin/bash --disabled-password --gecos "" --uid 1001 code4poznan \
    && chown -R code4poznan /workspace
USER code4poznan

COPY . /workspace

ENTRYPOINT bash docker_entrypoint.sh
