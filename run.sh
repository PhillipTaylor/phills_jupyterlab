#!/bin/bash

docker run --gpus all --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 -it --publish "8888:8888" -v="$(pwd)/workingarea:/workingarea" phills-jupyterlab /usr/local/bin/jupyter-lab
