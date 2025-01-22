---
tags: Server
---

# Server status

- [x] <- means service is online
- [ ] <- means service is offline

## domain

my domain: young-tw.com, youngtw.net

## websites and applications

### application

- [ ] [synapse](https://matrix.young-tw.com)
    - [ ] bridbge to discord
- [ ] [gitlab](https://gitlab.young-tw.com)
- [ ] [mastodon](https://social.young-tw.com)
- [ ] [nextcloud](https://cloud.young-tw.com)
- [ ] [uptime kuma(by young)](https://status.youngtw.net)
- [x] [uptime kuma(by yuan)](https://status.young-tw.com)

### static websites

- [x] [blog](https://blog.young-tw.com)
- [x] [link](https://youngtw.net)
- [x] [mc-website](https://mc.young-tw.com)

## Docker images

- [x] [youngtw/blog](https://hub.docker.com/repository/docker/youngtw/blog)
- [x] [youngtw/link](https://hub.docker.com/repository/docker/youngtw/link)
- [x] [youngtw/mc-website](https://hub.docker.com/repository/docker/youngtw/mc-website)

- [ ] [rclone/rclone](https://hub.docker.com/r/rclone/rclone)
- [ ] [linuxserver/mastodon](https://hub.docker.com/r/linuxserver/mastodon)
- [ ] [phanan/koel](https://hub.docker.com/r/phanan/koel)
- [ ] [louislam/uptime-kuma](https://hub.docker.com/r/louislam/uptime-kuma)
- [ ] [wernight/mopidy](https://hub.docker.com/r/wernight/mopidy)
- [ ] [nextcloud](https://hub.docker.com/_/nextcloud)
- [ ] [postgres](https://hub.docker.com/_/postgres)
- [ ] [jenkins](https://hub.docker.com/_/jenkins)
- [ ] [yourls](https://hub.docker.com/_/yourls)
- [ ] [gitlab-ce](https://hub.docker.com/r/gitlab/gitlab-ce)
- [ ] [synapse](https://hub.docker.com/r/matrixdotorg/synapse/)

## setting of youngtw.net and young-tw.com

| DOCKER IMAGE                   | PORTS                          | NAMES       | VOLUMES      | REQUIREMENTS        | DOMAIN              |
| ------------------------------ | ------------------------------ | ----------- | ------------ | ------------------- | ------------------- |
| youngtw/link:latest            | 0.0.0.0:12350->3000/tcp        | youngtw_net |              |                     | youngtw.net         |
| youngtw/mc-website:latest      | 0.0.0.0:12349->3000/tcp        | mc-website  |              |                     | mc.young-tw.com     |
| youngtw/blog:latest            | 443/tcp, 0.0.0.0:12347->80/tcp | blog        |              |                     | blog.young-tw.com   |
