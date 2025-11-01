ARG BUILD_FROM
FROM ${BUILD_FROM}

# Install VLC
WORKDIR /usr/src
RUN \
    set -x \
    && apk add --no-cache \
        inotify-tools \
        nginx \
        curl \
        sox \
        pwgen \
        vlc \
    && sed -i 's/geteuid/getppid/' /usr/bin/vlc \
    && sed -i '197s#.*#    dir = dir == undefined ? "file:///media" : dir;#' /usr/share/vlc/lua/http/js/controllers.js
        
WORKDIR /
COPY rootfs /
chmod +x /workdayAlarmClock /run.sh
EXPOSE 8081/tcp

CMD [ "/bin/bash", "/run.sh" ]
