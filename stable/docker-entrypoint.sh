#!/usr/bin/env sh

: ${VNC_PASS='secret'}

echo VNC PASS $VNC_PASS

Xvfb :99 &
X_PID=$!
DISPLAY=':99'

x11vnc -display :99 -ncache 10 -passwd $VNC_PASS &
VNC_PID=$!

teardown() {
    kill $VNC_PID
    kill $X_PID
}

trap teardown 2 15

chromedriver --port=4444 --whitelisted-ips *

