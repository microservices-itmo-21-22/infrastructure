#!/bin/bash

mkdir -p ./prometheus/data 2>/dev/null
chown -R 65534:65534 ./prometheus/data

mkdir -p ./grafana/data 2>/dev/null
chown -R 472:root ./grafana/data

mkdir -p /etc/docker 2>/dev/null
cp ./docker/daemon.json /etc/docker/daemon.json 2>/dev/null

mkdir -p /etc/systemd/system/docker.service.d 2>/dev/null
cp ./docker/options.json /etc/systemd/system/docker.service.d/options.conf 2>/dev/null

systemctl daemon-reload
systemctl restart docker
