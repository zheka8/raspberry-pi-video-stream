#!/bin/bash
source stream_keys.sh

FPS=10
ROT=270
URL="rtmp://lhr04.contribute.live-video.net/app/"
WIDTH=640
HEIGHT=480

v4l2-ctl --set-ctrl=rotate=$ROT

ffmpeg -ar 44100 -ac 2 -acodec pcm_s16le -f s16le -ac 2 -i /dev/zero \
 -f v4l2 -thread_queue_size 512 -codec:v h264 -r $FPS \
 -s "$WIDTH"x"$HEIGHT" -i /dev/video0 -b:v 128k -codec:v copy -acodec aac -ab 0k \
 -f flv "$URL""$TWITCH_STREAM_KEY"

