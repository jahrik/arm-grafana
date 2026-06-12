FROM docker.io/grafana/grafana:13.0.2

LABEL org.opencontainers.image.authors="jahrik@gmail.com"

ENV GF_INSTALL_PLUGINS=grafana-piechart-panel,grafana-worldmap-panel
