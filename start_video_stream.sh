#!/bin/bash

FPS=30
ROT=180

raspivid -o - -t 0 -n -w 1280 -h 1024 -fps $FPS -rot $ROT | cvlc -vvv stream:///dev/stdin --sout '#rtp{sdp=rtsp://:8554/stream}' :demux=h264 --h264-fps=$FPS
