#!/bin/bash

echo "Workday Alarm Clock Add-on started."

# -------------------------------------------------------------
# 传递配置到主程序
# -------------------------------------------------------------
# 从 Add-on options 中获取媒体实体ID
#MEDIA_ENTITY_ID=$(bashio::config 'MEDIA_PLAYER_ENTITY_ID')

#echo "Configured Media Player Entity ID: ${MEDIA_ENTITY_ID}"

# -------------------------------------------------------------
# [启动主程序] 运行 workdayAlarmClock
# -------------------------------------------------------------
# 使用 exec 启动您的主程序，并将媒体实体ID和HA令牌作为环境变量或参数传递
# 注意：HASS_TOKEN 会自动由 Supervisor 提供给 Add-on
exec /usr/bin/workdayAlarmClock

# 假设您的 Go 程序现在接受实体ID作为命令行参数
