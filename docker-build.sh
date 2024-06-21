#!/bin/bash

# 1.初始化frontend和backend内容
./docker/init.sh

# 2.开始构建前端
cd ./frontend && docker build -t sathub-mempool-web:v1.0 . && cd -

# 3.开始构建后端
docker buildx build --build-context rustgbt=./rust --build-context backend=./backend -t sathub-mempool-backend:v1.0 ./backend