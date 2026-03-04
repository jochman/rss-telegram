FROM python:3.11.12-alpine3.22

WORKDIR /app

RUN pip install --no-cache-dir feedparser python-telegram-bot==20.7 requests

COPY rss_telegram.py .

RUN mkdir -p /app/data

ENV INCLUDE_DESCRIPTION="true"
ENV DISABLE_NOTIFICATION="false"
ENV CHECK_INTERVAL=3600
ENV FEEDS_FILE="/app/data/feeds.txt"

CMD ["python", "rss_telegram.py"]
