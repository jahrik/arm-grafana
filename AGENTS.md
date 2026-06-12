# AGENTS.md

Multi-arch Grafana image: pinned `FROM` over official `grafana/grafana` + `GF_INSTALL_PLUGINS`, deployed in the `monitor` swarm stack behind traefik.

## Commands

```bash
make build                                  # build jahrik/arm-grafana:latest
docker run -d -p 3000:3000 jahrik/arm-grafana:latest   # then curl :3000/api/health
make deploy                                 # swarm stack deploy (stack: monitor)
```

## CI

`build.yml`: Test (build + `/api/health` poll) on PR; Release (buildx amd64/arm64/armv7 push to Docker Hub) on merge to main. Needs `DOCKERHUB_USERNAME`/`DOCKERHUB_TOKEN` secrets.

## Quirks

- Bump Grafana via the `FROM` tag; plugins install at build time via `GF_INSTALL_PLUGINS`.
- All runtime config is `GF_*` env vars in the compose (the old `config.ini` deb layout is gone).
- External `traefik` + `monitor` overlay networks — keep that wiring.
