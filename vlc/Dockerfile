
ARG BUILD_FROM
FROM debian:bookworm-slim

WORKDIR /usr/bin
RUN apt-get update && \
    apt-get install -y --no-install-recommends sox curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /
COPY rootfs /

RUN chmod +x /usr/bin/workdayAlarmClock /run.sh

EXPOSE 8080/tcp

CMD [ "/bin/bash", "/run.sh" ]
