#!/bin/bash

cd /Users/pth758/git/phills_jupyterlab/

docker run --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 -it --publish "9098:8888" -v="/Users/pth758/projects/jupyter_root:/workspace" phills-jupyterlab /usr/local/bin/jupyter-lab --ServerApp.token=b342bh34b2jhb423 --LabApp.custom_css=True
