#!/usr/bin/with-contenv bashio  # 确保这一行是正确的 HA Shebang

bashio::log.info "Starting custom alarm player service..."

# 启动你的程序，以后台方式运行，防止阻塞 S6 进程
/usr/local/bin/workdayAlarmClock /usr/local/bin/meMp3Player &

# 容器的主进程由 S6-Overlay 接管，只要 /usr/bin/with-contenv bashio 
# 成功启动 S6 服务（legacy-services），容器就不会退出。
# 假设 workdayAlarmClock 运行后会阻塞（前台运行），
# 并且它内部负责启动 meMp3Player 和 Web 服务。

# 如果 workdayAlarmClock 退出，容器就会退出。
# 如果它不是一个阻塞程序，你需要将其后台运行，并用其他服务保持容器存活。

# ----------------------------------------------------
# 替代方案（如果 workdayAlarmClock 不是阻塞程序）
# ----------------------------------------------------
# /usr/local/bin/workdayAlarmClock /usr/local/bin/meMp3Player &
#
# # 启动一个轻量级的，永不退出的服务来保持容器存活，
# # 例如，如果你不需要 VLC 或 Nginx，这个容器可能会使用一个简单的 'sleep infinity'。
# # 但 HA Add-on 的基础镜像通常已经包含 S6 进程管理，
# # 你可能需要启动一个 S6 服务来保持活跃。

# 由于你的程序需要浏览器控制，我们假设 workdayAlarmClock 
# 或 meMp3Player 之一会以守护进程形式运行并提供 8080 端口服务。

# 如果它们都后台运行且运行结束后不退出，那么你的 ADD-ON 的基础 S6 进程会自动保持容器活跃。

