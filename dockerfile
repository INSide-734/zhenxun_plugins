# FROM mirekphd/python3.10-ubuntu20.04
FROM zhenxunbot:1.0
ENV TZ=Asia/Shanghai
ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8
ENV TZ Asia/Shanghai
ADD . /root/zhenxun_bot
# RUN apt update && apt install -y wget vim ffmpeg locales locales-all fonts-noto libnss3-dev libxss1 libasound2 libxrandr2 libatk1.0-0 libgtk-3-0 libgbm-dev libxshmfence1 git
WORKDIR /root/zhenxun_bot
RUN pip3 install poetry
RUN poetry install
RUN poetry run playwright install chromium
RUN poetry run playwright install-deps chromium
RUN poetry run meme download
ENTRYPOINT poetry run python3 bot.py