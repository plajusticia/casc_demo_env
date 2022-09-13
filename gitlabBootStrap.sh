#!/bin/sh
sudo mkdir /gitlab/config/trusted-certs
sudo mkdir /gitlab/data
sudo mkdir /gitlab/logs
sudo mkdir /gitlab/app
sudo podman create --hostname $(hostname -f) --log-driver k8s-file --publish 4443:443 --publish 2222:22 --name gitlab --restart always --volume /gitlab/config:/etc/gitlab:Z --volume /gitlab/logs:/var/log/gitlab:Z --volume /gitlab/data:/var/opt/gitlab:Z  docker.io/gitlab/gitlab-ce:latest
