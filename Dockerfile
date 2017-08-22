FROM python:2-alpine

## Prerequisites
ENV PACKAGES_REQUIRED="\
	git"

## Install Prerequisites, get PlexPy, and create the plexpy user
RUN apk add --no-cache git \
	&& git clone https://github.com/JonnyWong16/plexpy.git /app \
	&& addgroup -S plexpy \
	&& adduser -h /app -G plexpy -S plexpy \
	&& chown -R plexpy:plexpy /app

## Set Volume
VOLUME /app

## Set Port
EXPOSE 8181

## Set Entrypoint
ADD entrypoint.sh /entrypoint.sh
USER plexpy
ENTRYPOINT ["./entrypoint.sh"]
