# -----------------------------------------------------------
# 使用标准 Alpine 镜像作为基础镜像
# -----------------------------------------------------------
FROM alpine:3.18

# 设置作者
LABEL io.hass.name="Workday Alarm Clock" io.hass.version="1.0.0"

# -----------------------------------------------------------
# 安装依赖
# -----------------------------------------------------------
RUN apk update && \
    apk add --no-cache \
        # Add-on 运行所需的 Home Assistant 依赖
        bash \
        s6-overlay \
        # 您的程序依赖
        sox \
        curl \
        alsa-utils \
        alsa-lib \
        alsa-lib-dev && \
    rm -rf /var/cache/apk/*

# -----------------------------------------------------------
# 配置 s6-overlay 环境
# -----------------------------------------------------------
# Home Assistant Add-on 惯例，设置 s6-overlay 启动
ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=2
COPY rootfs/ /

# -----------------------------------------------------------
# 容器运行时配置
# -----------------------------------------------------------
# 赋予可执行权限
RUN chmod +x /usr/bin/workdayAlarmClock /usr/bin/meMp3Player /run.sh

# 声明 HTTP 服务的端口 (即使使用 host_network 也推荐声明)
EXPOSE 8080/tcp

# 定义容器启动时运行的命令 (使用 s6 启动)
CMD [ "/init" ]
