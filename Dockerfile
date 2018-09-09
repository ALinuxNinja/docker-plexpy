FROM python:2-alpine

## Get latest version
ADD current_release.tar.gz /tmp/current_release.tar.gz
ARG APP_VERSION
ENV APP_VERSION $APP_VERSION

## Install Prerequisites, get PlexPy, and create the plexpy user
RUN cd /tmp/ \
	&& tar xvf current_release.tar.gz \
	&& rm /tmp/current_release.tar.gz
        && mv Tautulli-* /app \
	&& addgroup plexpy \
	&& adduser -h /app -G plexpy -D -u 1000 plexpy \
	&& chown -R plexpy:plexpy /app

## Set Volume
VOLUME /app

## Set Port
EXPOSE 8181

## Set Entrypoint
ADD entrypoint.sh /entrypoint.sh
USER plexpy
ENTRYPOINT ["./entrypoint.sh"]
