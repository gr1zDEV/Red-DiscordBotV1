FROM python:3.11-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Create the redbot user
RUN useradd -ms /bin/bash redbot

# Copy entrypoint and make it executable (still as root)
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Now switch to non-root user
USER redbot
WORKDIR /home/redbot

# Install Red-Bot
RUN pip install -U pip wheel && pip install -U Red-DiscordBot

# Mount persistent volume
VOLUME ["/home/redbot/data"]

# Start script
CMD ["/entrypoint.sh"]
