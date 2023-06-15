# syntax=docker/dockerfile:1
FROM python:3
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
RUN mkdir -p /var/www
WORKDIR /var/www
COPY requirements.txt /var/www/
RUN pip install -r requirements.txt
COPY . /var/www/
