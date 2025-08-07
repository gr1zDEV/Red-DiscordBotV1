FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash redbot
USER redbot
WORKDIR /home/redbot

RUN pip install -U pip wheel && pip install -U Red-DiscordBot

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME ["/home/redbot/data"]

CMD ["/entrypoint.sh"]
