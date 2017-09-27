FROM ubuntu:14.04
MAINTAINER Akshay Bhat <akshayubhat@gmail.com>
RUN mkdir "/root/model/"
RUN apt-get update -q && apt-get install -y wget
WORKDIR "/root/model"
RUN wget https://www.dropbox.com/s/z23vrvndtlpv2n1/checkpoint -o checkpoint
RUN wget https://www.dropbox.com/s/zro5lexhb7ai17w/model.ckpt-49491.index -o model.ckpt-49491.index
RUN wget https://www.dropbox.com/s/3cvu7oaw6ostgky/model.ckpt-49491.data-00000-of-00001 -o model.ckpt-49491.data-00000-of-00001
RUN wget https://www.dropbox.com/s/h3d1wgpuwtnksyo/model.ckpt-49491.meta -o model.ckpt-49491.meta
RUN apt-get update -q && apt-get install -y pkg-config python-dev python-opencv unzip libopencv-dev python-pip libav-tools libjpeg-dev  libpng-dev  libtiff-dev  libjasper-dev  python-numpy python-scipy  python-pycurl  python-opencv git nginx supervisor libpq-dev python-cffi build-essential libssl-dev libffi-dev python-dev
RUN dpkg -L python-opencv
RUN pip install --upgrade matplotlib
RUN pip install https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.2.0-cp27-none-linux_x86_64.whl
RUN git clone https://github.com/akshayubhat/EAST /root/EAST
WORKDIR "/root/EAST"
RUN pip install --upgrade cffi
RUN pip install -r requirements.txt
VOLUME ["/root/EAST/static/results"]
EXPOSE 8769
CMD ["python","server.py"]

