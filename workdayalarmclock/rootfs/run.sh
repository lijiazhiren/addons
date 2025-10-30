#!/bin/bash



# -------------------------------------------------------------

# 启动脚本 (run.sh)

# -------------------------------------------------------------



echo "Workday Alarm Clock Add-on started."



# -------------------------------------------------------------

# [音频调试检查] 检查 ALSA 设备

# -------------------------------------------------------------

# 如果 /dev/snd 被正确映射且 ALSA 库可用，这个命令应该显示声卡信息

echo "Checking ALSA devices..."

aplay -l

if [ $? -ne 0 ]; then

    echo "Warning: aplay command failed. Audio device may not be correctly configured."

fi



# -------------------------------------------------------------

# [启动主程序] 运行 workdayAlarmClock

# -------------------------------------------------------------

# 运行主程序，并将 MP3 播放器作为参数传递

# 注意：由于使用了 host_network，程序将监听宿主机的 8080 端口

# 假设您的程序可以找到位于 /usr/bin/ 的 meMp3Player

echo "Starting workdayAlarmClock on 0.0.0.0:8080..."

exec /usr/bin/workdayAlarmClock /usr/bin/meMp3Player



# 使用 exec 可以确保 workdayAlarmClock 成为容器的主进程 (PID 1)，

# 当它退出时，容器也会随之退出，方便 HA Supervisor 监控。
