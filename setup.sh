#!/bin/bash
if [[ -z "$SUPERUSER" || -z "$PORT" || -z "$HOST" || -z "$DB_LINK" ]]; then
  echo -e "\033[31m相关配置文件未填写，请在 docker-compose.yml 内填写完整\033[0m"
  exit 1
else
  echo "当前 BOT 超级用户: $SUPERUSER"
  echo "当前端口: $PORT"
  echo "当前 IP: $HOST"
  echo "数据库链接: $DB_LINK"
  echo "GOCQ 面板: http://$HOST:$PORT/go-cqhttp/"
fi

if [[ ! -z "$GOCQ_WEBUI_USERNAME" && ! -z "$GOCQ_WEBUI_PASSWORD" ]]; then
  echo "GOCQ 面板账号: $GOCQ_WEBUI_USERNAME"
  echo "GOCQ 面板密码: $GOCQ_WEBUI_PASSWORD"
elif [[ ! -z "$GOCQ_WEBUI_USERNAME" || ! -z "$GOCQ_WEBUI_PASSWORD" ]]; then
  echo -e "\033[31mGOCQ 面板设置错误，请检查 docker-compose.yml 文件内配置填写是否正确\033[0m"
  exit 1
fi

# 检查是否存在数据库链接环境变量
if [[ -z "$DB_LINK" ]]; then
    echo -e "\033[31m未设置数据库链接，请在 docker-compose.yml 内填写 DB_LINK\033[0m"
    exit 1
fi

# 判断是否是第一次运行脚本
if [[ ! -f "$(dirname "$0")/first_run" ]]; then
    touch "$(dirname "$0")/first_run"
    echo "首次运行正在修改数据库连接地址"
    # 修改 /configs/config.py 文件第23行的内容
    sed -i '23s#""#"'"$DB_LINK"'"#' "$(dirname "$0")/configs/config.py"
    # 注释掉脚本内容
    sed -i '2,37s/^/#/' "$0"
    # 添加 'poetry run python3 bot.py'
    # echo 'poetry run python3 bot.py' >> "$0"
fi

for i in {5..1}; do
echo -ne "$i秒后启动bot\r"
sleep 1
done
echo "启动bot"
python3 bot.py