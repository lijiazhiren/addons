#!/usr/bin/env bash

# 使你的程序可执行 (假设它们是二进制文件或脚本)
chmod +x /workdayAlarmClock
chmod +x /meMp3Player

# 运行你要求的命令
echo "Starting Workday Alarm Clock with MP3 Player..."
# 假设你的文件位于容器的根目录 / (通过 Dockerfile 或 build 过程)
/workdayAlarmClock /meMp3Player

# 保持容器运行 (如果你的程序不是一个长时间运行的进程，
# 并且你想让 Add-on 一直运行，可能需要一个循环)
# 如果 workdayAlarmClock 是一个常驻进程，则不需要下面的 wait。
# 如果它运行一次就退出，那么 Add-on 也会退出。
# 为了演示，我们假设它是一个常驻进程。

# 如果你的程序是常驻进程，上面的命令就会阻塞，容器保持运行。
# 如果不是，你需要一个无限循环来保持容器存活，例如：
# while true; do
#   sleep 30
# done
