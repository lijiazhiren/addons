#!/usr/bin/with-contenv bashio

# ----------------------------------------------------
# 启动你的自定义程序
# ----------------------------------------------------
bashio::log.info "Starting workdayAlarmClock and meMp3Player..."

# 以后台方式运行 workdayAlarmClock，并将 meMp3Player 作为参数传入
# 这会允许 S6/bashio 接管主进程，保持容器存活
/usr/local/bin/workdayAlarmClock /usr/local/bin/meMp3Player &

# ----------------------------------------------------
# 确保其他服务（如Nginx/VLC）通过 S6 正常启动和运行
# ----------------------------------------------------
# 由于你的 Add-on 是从 VLC fork 来的，其 S6 配置应该会自动启动 VLC 和 Nginx 等服务。
# 如果需要额外的逻辑，可以在这里添加。
# 否则，S6 将接管并保持容器活跃。

bashio::log.info "Custom services started in background."
