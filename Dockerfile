FROM alpine:latest

#Install necessary packages
RUN apk add --no-cache \
    x11vnc \
    xvfb \
    firefox \
    openbox \
    xterm \
    mesa-gl \
    ttf-dejavu \
    dbus-x11

# Set up VNC password
RUN mkdir ~/.vnc && x11vnc -storepasswd XXX ~/.vnc/passwd

# Create a startup script for openbox
RUN echo '#!/bin/sh' > ~/.vnc/xstartup \
    && echo 'openbox-session &' >> ~/.vnc/xstartup \
    && echo 'xterm &' >> ~/.vnc/xstartup \
    && chmod +x ~/.vnc/xstartup

# Set up environment
ENV DISPLAY=:0

EXPOSE 5900

# Start Xvfb, openbox, and x11vnc
CMD Xvfb :0 -screen 0 1024x768x16 & \
    sleep 1 && \
    . ~/.vnc/xstartup & \
    x11vnc -forever -usepw -create -env FD_PROG=/root/.vnc/xstartup