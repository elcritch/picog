#!/bin/sh

sudo docker run \
    --rm \
    --device $(tty) \
    --env XDG_RUNTIME_DIR=/tmp \
    --cap-add=ALL --uts=host --net=host --pid=host --ipc=host \
    --privileged \
    --volume=/dev/:/dev/ \
    --user 1000:1000 \
    -e WLR_NO_HARDWARE_CURSORS=1 \
    -e WLR_LIBINPUT_NO_DEVICES=1 \
    bookworm-wayland:latest \ 
        cage -- cog google.com 

