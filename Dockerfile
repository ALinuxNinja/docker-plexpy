FROM python:2-alpine
MAINTAINER CatDeployed <dev@catdeployed.com>

## Get latest version
COPY current_release.tar.gz /tmp/current_release.tar.gz
ARG APP_VERSION
ENV APP_VERSION $APP_VERSION

## Install Prerequisites, get Tautulli, and create the  user
RUN apk --no-cache add tar \
	&& cd /tmp/ \
	&& tar xvf current_release.tar.gz \
	&& rm /tmp/current_release.tar.gz \
        && mv Tautulli-* /app \
	&& mkdir -p /app/.docker/config /app/.docker/data \
	&& addgroup app \
	&& adduser -h /app -G app -D -u 1000 app \
	&& chown -R app:app /app \
	&& apk del tar

## Set WORKDIR
WORKDIR /app

## Set Port
EXPOSE 8181

## Set Entrypoint
ADD entrypoint.sh /entrypoint.sh
USER app
ENTRYPOINT ["./entrypoint.sh"]
