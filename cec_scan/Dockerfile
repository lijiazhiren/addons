ARG BUILD_FROM
FROM $BUILD_FROM

WORKDIR /usr/bin
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        bash \
        sox \
        curl && \  // 仅保留 curl (如果您程序内部依赖它)
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# -----------------------------------------------------------
# 复制程序文件和启动脚本
# -----------------------------------------------------------
WORKDIR /
COPY rootfs /

# -----------------------------------------------------------
# 赋予可执行权限 (只需对 workdayAlarmClock 和 run.sh)
# -----------------------------------------------------------
RUN chmod +x /usr/bin/workdayAlarmClock /run.sh

# -----------------------------------------------------------
# 容器运行时配置
# -----------------------------------------------------------
EXPOSE 8080/tcp

# 启动命令
CMD [ "/bin/bash", "/run.sh" ]
