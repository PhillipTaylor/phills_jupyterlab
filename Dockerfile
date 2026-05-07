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
#RUN curl -Lo coursier https://git.io/coursier-cli
#RUN chmod ugo+x coursier
#RUN ./coursier launch --fork almond -- --install
RUN rm -rf ~/.cache/coursier
RUN curl -fL https://github.com/VirtusLab/coursier-m1/releases/latest/download/cs-aarch64-pc-linux.gz | gzip -d > cs
RUN chmod +x cs
RUN yes | ./cs setup
RUN ./cs launch --use-bootstrap almond:0.14.5 --scala 2.13 -- --install --id scala-2.13 --display-name "Scala 2.13 (Almond)"
RUN ./cs launch --use-bootstrap almond:0.14.5 --scala 3.3.5 -- --install --id scala-3 --display-name "Scala 3 (Almond)"

# Rust support
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN ~/.cargo/bin/cargo install evcxr_jupyter
RUN ~/.cargo/bin/evcxr_jupyter --install
