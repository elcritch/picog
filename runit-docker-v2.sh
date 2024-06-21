#!/bin/sh


sudo docker run \
    --rm \
    --device $(tty) \
    --env XDG_RUNTIME_DIR=/tmp \
    --cap-add=ALL --uts=host --net=host --pid=host --ipc=host \
    --privileged \
    --volume=/dev/:/dev/ \
    --user 1000:1000 \
    -it \
    bookworm-wayland:latest \ 
        cage -- cog google.com 

    --device /dev/dri \
    --device /dev/input \

#    agetty --autologin root \
#        --login-options '' \
#	--login-program /usr/bin/weston $(tty | sed 's/dev\///')

