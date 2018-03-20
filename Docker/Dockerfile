FROM gcr.io/tensorflow/tensorflow:1.5.0-devel-gpu
RUN apt-get update && apt-get install -y \
  git
  
RUN add-apt-repository ppa:jonathonf/ffmpeg-3 -y 

RUN apt update && apt install ffmpeg libav-tools x264 x265 -y

RUN apt-get install -y protobuf-compiler \
  python-lxml \
  python-pil \
  build-essential cmake pkg-config \
  libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev \
  libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
  libxvidcore-dev libx264-dev \
  libgtk-3-dev \
  libatlas-base-dev gfortran \
  python2.7-dev \
  python-tk 
  
 RUN pip install opencv-python==3.4.0.12 requests
  

# change to tensorflow dir
WORKDIR /tensorflow

# clone the models repo
RUN git clone https://github.com/tensorflow/models.git

WORKDIR models/research

RUN protoc object_detection/protos/*.proto --python_out=.
RUN echo "export PYTHONPATH=${PYTHONPATH}:`pwd`:`pwd`/slim" >> ~/.bashrc
RUN python setup.py install

WORKDIR /tensorflow/models/research/object_detection

RUN wget https://raw.githubusercontent.com/sofwerx/tensorflow-person-detection/master/PersonDetectionCamera.py

RUN wget https://raw.githubusercontent.com/sofwerx/tensorflow-person-detection/master/GetImages.sh

RUN chmod +x GetImages.sh


RUN ./GetImages.sh

CMD ["python", "PersonDetectionCamera.py"]

