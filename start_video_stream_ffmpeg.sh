#!/bin/bash
source stream_keys.sh

FPS=12
ROT=180
URL="rtmp://lhr04.contribute.live-video.net/app/"
#QUAL=20
WIDTH=640
HEIGHT=480

# Group of Pictures (ideally 2x FPS)
#let GOP=$FPS*2

if [ $ROT -eq 180 ]
then
	v4l2-ctl --set-ctrl vertical_flip=1
	v4l2-ctl --set-ctrl horizontal_flip=1
else
        v4l2-ctl --set-ctrl vertical_flip=0
        v4l2-ctl --set-ctrl horizontal_flip=0
fi

ffmpeg -ar 44100 -ac 2 -acodec pcm_s16le -f s16le -ac 2 -i /dev/zero \
 -f v4l2 -thread_queue_size 512 -codec:v h264 -r $FPS \
 -s "$WIDTH"x"$HEIGHT" -i /dev/video0 -b:v 256k -codec:v  copy -acodec aac -ab 128k \
 -f flv "$URL""$TWITCH_STREAM_KEY"

