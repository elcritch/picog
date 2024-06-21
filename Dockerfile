FROM docker.io/dtcooper/raspberrypi-os:bookworm

ARG USERNAME=kiosk
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN apt update \
    && apt install -y libfontconfig1 libdbus-1-3 libfreetype6 libicu72 libinput10 libinput-tools libxkbcommon0 \
			libsqlite3-0 libssl1.1 libpng16-16 libpng-tools libjpeg-tools libjpeg62-turbo \
			libglib2.0-0 libgles2-mesa \
			libgbm1 libdrm2 libdrm-common \
			cog cage xwayland sudo

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

RUN chmod u+s /usr/bin/cog \
    && chmod u+s /usr/bin/cage

