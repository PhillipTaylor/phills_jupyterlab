FROM nvcr.io/nvidia/tensorflow:25.01-tf2-py3

RUN apt-get update
RUN apt-get install -y openjdk-17-jdk nodejs npm mariadb-client vim wget curl
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install matplotlib jupyter seaborn mysql-connector-python

#RUN groupadd user -g 1000
#RUN useradd -u 1000 -g 1000 -m -d /home/user user

#RUN touch /home/user/.jupyter/custom/custom.css
#RUN chmod ugo+rwx /home/user/.jupyter/custom/custom.css

USER 1000:1000

WORKDIR /home/user

# Scala support
RUN curl -Lo coursier https://git.io/coursier-cli
RUN chmod ugo+x coursier
RUN ./coursier launch --fork almond -- --install

# Rust support
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN ~/.cargo/bin/cargo install evcxr_jupyter
RUN ~/.cargo/bin/evcxr_jupyter --install
