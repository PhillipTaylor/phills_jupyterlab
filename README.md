
# Phill's Jupyterlab Image

This is the Jupyterlab image I use locally for data analysis and training AI.

Over the standard jupyterlab image it also includes:

    * A Scala kernel (Almond) as I use this language daily.
    * Tensorflow 2
    * This docker image is based on the optimised Nvidia docker image so it can do GPU accelerated machine learning.
    * A systemd init script so it can always available on my machine. (Just symlink to /etc/systemd/system/)

