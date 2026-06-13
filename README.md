# arm-grafana

[![Build](https://github.com/jahrik/arm-grafana/actions/workflows/build.yml/badge.svg)](https://github.com/jahrik/arm-grafana/actions/workflows/build.yml)

Multi-arch [Grafana](https://grafana.com/) image for the `monitor` swarm stack. Originally a Grafana 6 deb on Ubuntu for ARM nodes; now a pinned layer over the official `grafana/grafana` image with piechart and worldmap plugins preinstalled.

## Run

```bash
docker run -d -p 3000:3000 jahrik/arm-grafana:latest
curl http://localhost:3000/api/health
```

## Deploy (swarm)

```bash
docker network create -d overlay monitor   # once
make deploy                                # stack: monitor, behind traefik
```

Admin, SMTP, and MySQL settings come from `GF_*` env vars (see `docker-compose.yml`).

## Build

```bash
make build
make push
```

CI: PR builds + `/api/health` check; merge to main pushes multi-arch (amd64/arm64/armv7) to Docker Hub.
