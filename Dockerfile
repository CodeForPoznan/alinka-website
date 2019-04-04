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

USER node

COPY . /workspace

ENTRYPOINT bash docker_entrypoint.sh
