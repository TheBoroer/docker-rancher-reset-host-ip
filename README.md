# docker-rancher-reset-host-ip
Updates rancher host IP to current eth0 IP (useful for getting LAN IP for hosts behind NAT)
## docker run command
`docker run --rm  -v /var/run/docker.sock:/var/run/docker.sock -it boro/rancher-reset-host-ip`
## docker-compose
```
update-host-ip:
  log_driver: ''
  labels:
    io.rancher.scheduler.global: 'true'
    io.rancher.container.pull_image: always
    io.rancher.container.start_once: 'true'
  tty: true
  log_opt: {}
  image: boro/rancher-reset-host-ip
  volumes:
  - /var/run/docker.sock:/var/run/docker.sock
  stdin_open: true
```
