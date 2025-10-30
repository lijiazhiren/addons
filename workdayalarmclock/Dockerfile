# -----------------------------------------------------------

# 使用 Home Assistant 推荐的 Alpine Linux 作为基础镜像

# -----------------------------------------------------------

FROM ghcr.io/home-assistant/alpine-base:3.18



# 设置作者

LABEL io.hass.name="Workday Alarm Clock" io.hass.version="1.0.0"



# -----------------------------------------------------------

# 安装依赖

# -----------------------------------------------------------

RUN apk update && \

    apk add --no-cache \

        sox \

        curl \

        alsa-utils \

        alsa-lib \

        alsa-lib-dev && \

    rm -rf /var/cache/apk/*



# -----------------------------------------------------------

# 复制程序文件和启动脚本

# -----------------------------------------------------------

# 将 rootfs 目录下的文件复制到容器的根目录

COPY rootfs/ /



# 设置可执行权限

RUN chmod +x /usr/bin/workdayAlarmClock /usr/bin/meMp3Player /run.sh



# -----------------------------------------------------------

# 容器运行时配置

# -----------------------------------------------------------

# 声明 HTTP 服务的端口 (即使使用 host_network 也推荐声明)

EXPOSE 8080/tcp



# 定义容器启动时运行的命令

CMD [ "/bin/bash", "/run.sh" ]
