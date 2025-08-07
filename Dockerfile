FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Create and switch to a non-root user
RUN useradd -ms /bin/bash redbot
USER redbot
WORKDIR /home/redbot

# Install Red-Bot
RUN pip install -U pip wheel && pip install -U Red-DiscordBot

# Create persistent data volume
VOLUME ["/home/redbot/data"]

# This will run the bot when the container starts
CMD ["redbot", "--no-prompt", "--token", "${DISCORD_TOKEN}", "instance"]
