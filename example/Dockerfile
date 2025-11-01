ARG BUILD_FROM
FROM debian:bookworm-slim

WORKDIR /

# 步骤 1: 安装所有依赖，包括 sox, curl, alsa-utils, wget 和 必需的 ca-certificates
RUN apt-get update && \
    apt-get install -y --no-install-recommends sox curl alsa-utils wget ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 步骤 2: 使用 wget 下载文件并赋予执行权限
# wget 的 -O (大写O) 用于指定输出文件路径和名称
# wget 默认也会跟随重定向，类似于 curl -L
RUN wget -O /workdayAlarmClock https://github.com/zanjie1999/workdayAlarmClockGo/releases/latest/download/workdayAlarmClock-linux && \
    chmod +x /workdayAlarmClock && \
    wget -O /meMp3Player https://github.com/zanjie1999/meMp3Player/releases/latest/download/meMp3Player-linux && \
    chmod +x /meMp3Player

# 步骤 3: 赋予 run.sh 执行权限
# *** 警告：请确保您已在 Dockerfile 之前添加 COPY run.sh /run.sh ***
RUN chmod +x /run.sh

EXPOSE 8080/tcp

CMD [ "/bin/bash", "/run.sh" ]
