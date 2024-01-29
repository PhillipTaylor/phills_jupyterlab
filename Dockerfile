FROM nvcr.io/nvidia/tensorflow:23.12-tf2-py3

RUN apt-get update
RUN apt-get install -y openjdk-17-jdk
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install matplotlib pyqt5 jupyter seaborn

RUN groupadd user -g 1000
RUN useradd -u 1000 -g 1000 -m -d /home/user user
USER 1000:1000

WORKDIR /home/user
RUN curl -Lo coursier https://git.io/coursier-cli
RUN chmod ugo+x coursier
RUN ./coursier launch --fork almond -- --install
