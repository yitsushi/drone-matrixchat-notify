from python:3.11-alpine

label maintainer="Victoria Nadasdi <efertone@pm.me>"
label org.opencontainers.image.source=https://github.com/yitsushi/drone-matrixchat-notify
label org.opencontainers.image.description="Matrix plugin: Send Matrix message"
label org.opencontainers.image.licenses=MIT

run python3 -m pip --no-cache-dir install \
  bleach jinja2 markdown matrix-nio

add matrixchat-notify.py /bin/
add matrixchat-notify-config.json /etc/

run chmod +x /bin/matrixchat-notify.py

entrypoint ["/bin/matrixchat-notify.py", "-c", "/etc/matrixchat-notify-config.json"]
