
ARG BUILD_FROM
FROM debian:bookworm-slim

WORKDIR /
RUN apt-get update && \
    apt-get install -y --no-install-recommends sox curl alsa-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /

RUN ADD -L https://github.com/zanjie1999/workdayAlarmClockGo/releases/latest/download/workdayAlarmClock-linux -o /workdayAlarmClock && \
    chmod +x /workdayAlarmClock && \
    ADD -L https://github.com/zanjie1999/meMp3Player/releases/latest/download/meMp3Player-linux -o /meMp3Player && \
    chmod +x /meMp3Player

RUN chmod +x /run.sh

EXPOSE 8080/tcp

CMD [ "/bin/bash", "/run.sh" ]
