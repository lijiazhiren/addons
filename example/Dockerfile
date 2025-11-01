ARG BUILD_FROM
FROM debian:bookworm-slim

WORKDIR /

# 步骤 1: 安装依赖 (sox, curl, alsa-utils) 和 证书 (ca-certificates)
RUN apt-get update && \
    apt-get install -y --no-install-recommends sox curl alsa-utils ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 步骤 2: 使用 curl 下载文件并赋予执行权限
# 注意：这里使用 curl -L -o 代替了错误的 RUN ADD
RUN curl -L https://github.com/zanjie1999/workdayAlarmClockGo/releases/latest/download/workdayAlarmClock-linux -o /workdayAlarmClock && \
    chmod +x /workdayAlarmClock && \
    curl -L https://github.com/zanjie1999/meMp3Player/releases/latest/download/meMp3Player-linux -o /meMp3Player && \
    chmod +x /meMp3Player

# *** 警告：在运行此行之前，请确保 run.sh 文件已通过 COPY run.sh /run.sh 添加到镜像中 ***
RUN chmod +x /run.sh

EXPOSE 8080/tcp

CMD [ "/bin/bash", "/run.sh" ]
