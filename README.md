#### Alpine Linux Container (Default)
[![](https://images.microbadger.com/badges/version/catdeployed/tautulli.svg)](https://hub.docker.com/r/catdeployed/postal/) [![](https://images.microbadger.com/badges/image/catdeployed/tautulli.svg)](https://microbadger.com/images/catdeployed/tautulli)

A simple, ready to go container for Tautulli. Automatically updated each day by [CircleCI](https://circleci.com)

### Running
```docker run -d -p 127.0.0.1:80:8181 --name plexpy alinuxninja/tautulli```

### Persistent Volumes
Run the below command while container is running, and recreate the container with the "app" folder as a volume.

```
docker cp plexpy:/app app
chown -R 1000:1000 app
```

### SSL/Proxying
Use [jwilder/nginx-proxy](https://github.com/jwilder/nginx-proxy) along with [JrCs/docker-letsencrypt-nginx-proxy-companion](https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion) for LetsEncrypt SSL
