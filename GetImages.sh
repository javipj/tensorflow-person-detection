


while true; do
    
    ffmpeg -fflags discardcorrupt -i rtsp://admin:888888@192.168.0.164:10554/udp/av0_0 -f image2 -updatefirst 1 img.jpg -y
    
done 
