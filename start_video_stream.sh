#!/bin/bash
raspivid -o - -t 0 -n -w 1280 -h 1024 -fps 60 -rot 180 | cvlc -vvv stream:///dev/stdin --sout '#rtp{sdp=rtsp://:8554/stream}' :demux=h264 --h264-fps=60 &
