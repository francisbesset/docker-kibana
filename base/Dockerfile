FROM debian:wheezy

ENV DEBIAN_FRONTEND noninteractive

RUN echo "Europe/Paris" > /etc/timezone && dpkg-reconfigure tzdata

RUN apt-get update -y && apt-get upgrade -y
