FROM python:3.10.11-slim
# FROM mirekphd/python3.10-ubuntu20.04
# FROM zhenxunbot:1.0
ENV TZ=Asia/Shanghai
ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8
ADD . /root/zhenxun_bot
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& echo 'Asia/Shanghai' >/etc/timezone \
	&& apt-get update --fix-missing -o Acquire::http::No-Cache=True \
	&& apt-get install -y --assume-yes apt-utils --no-install-recommends \
	ffmpeg \
    locales \
    locales-all fonts-noto \
    fonts-noto-cjk \
    fonts-noto-color-emoji \
    libnss3-dev \
    libxss1 \
    libasound2 \
    libxrandr2 \
    libatk1.0-0 \
    libgtk-3-0 \
    libgbm-dev \
    libxshmfence1 \
	&& apt-get clean

# RUN apt update && apt install -y ffmpeg locales locales-all fonts-noto fonts-noto-cjk fonts-noto-color-emoji libnss3-dev libxss1 libasound2 libxrandr2 libatk1.0-0 libgtk-3-0 libgbm-dev libxshmfence1
WORKDIR /root/zhenxun_bot
RUN pip3 install --upgrade pip \
    && pip install -r requirements.txt --no-cache-dir

RUN playwright install chromium \
    && playwright install-deps chromium \
    && meme download

# RUN pip3 install poetry
# RUN poetry install
# RUN poetry run playwright install chromium \
#     && poetry run playwright install-deps chromium \
#     && poetry run meme download
ENTRYPOINT bash setup.sh