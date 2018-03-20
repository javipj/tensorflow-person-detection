# tensorflow-person-detection
### testing

cd Docker

docker build -t persondetect .

sudo -E docker run --rm  --network host --privileged -it -v $(xauth info  | grep Auth | cut -d: -f2 | awk '{print $1}'):/root/.Xauthority -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY --env="QT_X11_NO_MITSHM=1" -v /dev/video0:/dev/video0 --device /dev/snd persondetect

python PersonDetectionCamera.py & ./GetImages.sh
