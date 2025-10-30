ARG BUILD_FROM
FROM ${BUILD_FROM}

# 安装 dos2unix 和其他必要的工具
WORKDIR /usr/src
RUN \
    set -x \
    && apk add --no-cache \
        dos2unix \
        inotify-tools \
        nginx \
        pwgen \
        vlc \
    && sed -i 's/geteuid/getppid/' /usr/bin/vlc \
    && sed -i '197s#.*#    dir = dir == undefined ? "file:///media" : dir;#' /usr/share/vlc/lua/http/js/controllers.js

# ----------------------------------------------
# 修正后的文件拷贝、权限和换行符修复
# ----------------------------------------------
WORKDIR /
COPY rootfs /

# 修复 run.sh 的 Windows 换行符 (CRLF -> LF) 问题
RUN dos2unix /run.sh

# 赋予可执行文件执行权限
RUN chmod +x /usr/local/bin/workdayAlarmClock \
    && chmod +x /usr/local/bin/meMp3Player \
    && chmod +x /run.sh
# ----------------------------------------------

# 开放内部端口
EXPOSE 8080/tcp
EXPOSE 8080/udp

# 使用 /run.sh 作为容器的启动入口，由它来启动你的两个程序
CMD [ "/run.sh" ]
