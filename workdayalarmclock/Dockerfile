ARG BUILD_FROM
FROM ${BUILD_FROM}

# Install minimum required tools (bashio, etc.)
# Note: Since your original base image was Alpine, we keep apk, 
# but Home Assistant's base image usually has /usr/bin/bashio.
# We assume the base image is capable of running bash scripts.
# 如果你的程序需要其他依赖，在这里使用 apk add 安装。

# 1. 拷贝文件：将 rootfs 下的内容拷贝到容器根目录
WORKDIR /
COPY rootfs /

# 2. 权限：赋予可执行文件和启动脚本执行权限
RUN chmod +x /usr/local/bin/workdayAlarmClock \
    && chmod +x /usr/local/bin/meMp3Player \
    && chmod +x /run.sh

# 3. 端口：开放内部端口
EXPOSE 8080/tcp

# 4. 启动：使用 run.sh 作为容器启动入口
# HA Add-on 的标准做法是使用 /run.sh 或 /init。
# 我们使用 /run.sh，它将在 /usr/bin/with-contenv bashio 内部执行

CMD [ "/run.sh" ]
