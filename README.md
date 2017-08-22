## docker-plexpy [![Build Status](https://semaphoreci.com/api/v1/alinuxninja/docker-plexpy/branches/master/badge.svg)](https://semaphoreci.com/alinuxninja/docker-plexpy) [![](https://images.microbadger.com/badges/image/alinuxninja/plexpy.svg)](https://microbadger.com/images/alinuxninja/plexpy "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/alinuxninja/plexpy.svg)](https://hub.docker.com/r/alinuxninja/plexpy/ "Get your own version badge on microbadger.com")
A simple, ready to go container for PlexPy that autoupdates when the container is restarted. Automatically updated each day by [Semaphore CI](https://semaphoreci.com)

### Running
```docker run -d -p 127.0.0.1:80:8181 --name plexpy alinuxninja/plexpy```

### Persistent Volumes
Run the below command while container is running, and recreate the container with the "app" folder as a volume.

```docker cp plexpy:/app app```

### SSL/Proxying
Use [jwilder/nginx-proxy](https://github.com/jwilder/nginx-proxy) along with [JrCs/docker-letsencrypt-nginx-proxy-companion](https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion) for LetsEncrypt SSL
