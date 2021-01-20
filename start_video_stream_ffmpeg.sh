#!/bin/bash

FPS=25
ROT=180
PORT=8081
QUAL=20
WIDTH=640
HEIGHT=480

v4l2-ctl --set-ctrl vertical_flip=1
v4l2-ctl --set-ctrl horizontal_flip=1

ffmpeg -f s16le -i /dev/zero -f v4l2 -thread_queue_size 512 -codec:v h264 -s "$WIDTH"x"$HEIGHT" -i /dev/video0 -codec:v copy -acodec aac -ab 128k -r $FPS -g 50 -f flv rtmp://lhr04.contribute.live-video.net/app/live_638986575_yV6fOH3gtrWlOMF5VVvUKCxvYLbkvB
