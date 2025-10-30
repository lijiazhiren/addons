#!/usr/bin/with-contenv bashio

bashio::log.info "Starting custom alarm player service..."

/usr/local/bin/workdayAlarmClock /usr/local/bin/meMp3Player &
