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
- [x] [dockge](https://dockge.young-tw.com)
- [ ] [nextcloud](https://cloud.young-tw.com)
- [x] [portainer](https://admin.young-tw.com)
- [x] [uptime kuma(by young)](https://status.youngtw.net)
- [x] [uptime kuma(by yuan)](https://status.young-tw.com)

### static websites

- [x] [blog](https://blog.young-tw.com)
- [x] [link](https://youngtw.net)
- [x] [mc-website](https://mc.young-tw.com)

## Docker images

- [x] [youngtw/blog](https://hub.docker.com/repository/docker/youngtw/blog)
- [x] [youngtw/link](https://hub.docker.com/repository/docker/youngtw/link)
- [x] [youngtw/mc-website](https://hub.docker.com/repository/docker/youngtw/mc-website)

- [ ] [matrixdotorg/synapse](https://hub.docker.com/r/matrixdotorg/synapse)
- [ ] [rclone/rclone](https://hub.docker.com/r/rclone/rclone)
- [ ] [linuxserver/codimd](https://hub.docker.com/r/linuxserver/codimd)
- [ ] [linuxserver/openvscode-server](https://hub.docker.com/r/linuxserver/openvscode-server)
- [ ] [linuxserver/nextcloud](https://hub.docker.com/r/linuxserver/nextcloud)
- [ ] [linuxserver/mastodon](https://hub.docker.com/r/linuxserver/mastodon)
- [ ] [linuxserver/docker-wireguard](https://github.com/linuxserver/docker-wireguard)
- [ ] [phanan/koel](https://hub.docker.com/r/phanan/koel)
- [x] [louislam/uptime-kuma](https://hub.docker.com/r/louislam/uptime-kuma)
- [ ] [avhost/docker-matrix](https://hub.docker.com/r/avhost/docker-matrix)
- [ ] [wernight/mopidy](https://hub.docker.com/r/wernight/mopidy)
- [ ] [joplin/server](https://hub.docker.com/r/joplin/server)
- [ ] [nextcloud](https://hub.docker.com/_/nextcloud)
- [ ] [postgres](https://hub.docker.com/_/postgres)
- [ ] [jenkins](https://hub.docker.com/_/jenkins)
- [ ] [yourls](https://hub.docker.com/_/yourls)
- [ ] [gitlab-ce](https://hub.docker.com/r/gitlab/gitlab-ce)
- [ ] [synapse](https://hub.docker.com/r/matrixdotorg/synapse/)

## setting of youngtw.net and young-tw.com

| DOCKER IMAGE                   | PORTS                                                             | NAMES       | VOLUMES                                            | REQUIREMENTS        | DOMAIN              |
| ------------------------------ | ----------------------------------------------------------------- | ----------- | -------------------------------------------------- | ------------------- | ------------------- |
| gitlab/gitlab-ce               | 22/tcp, 443/tcp, 127.0.0.1:12351->80/tcp                          | gitlab      | gitlab-config, gitlab-logs, gitlab-data            |                     | gitlab.young-tw.com |
| matrixdotorg/synapse:latest    | 8009/tcp, 8448/tcp, 127.0.0.1:12346->8008/tcp, :::12346->8008/tcp | synapse     | synapse-data                                       |                     | matrix.young-tw.com |
| youngtw/link:latest            | 127.0.0.1:12350->3000/tcp                                         | youngtw_net |                                                    |                     | youngtw.net         |
| youngtw/link:latest            | 127.0.0.1:12348->3000/tcp                                         | link        |                                                    |                     | link.young-tw.com   |
| youngtw/mc-website:latest      | 127.0.0.1:12349->3000/tcp                                         | mc-website  |                                                    |                     | mc.young-tw.com     |
| postgres                       | 5432/tcp                                                          | sql         | /mnt/sdb/db/pgdata                                 |                     |                     |
| youngtw/blog:latest            | 443/tcp, 127.0.0.1:12347->80/tcp                                  | blog        |                                                    |                     | blog.young-tw.com   |
| linuxserver/nextcloud          | 80/tcp, 127.0.0.1:12345->443/tcp                                  | nextcloud   | /mnt/sdb/nextcloud/data /mnt/sdb/nextcloud/appdata |                     | cloud.young-tw.com  |
| louislam/uptime-kuma:1         | 127.0.0.1:3001->3001/tcp, :::3001->3001/tcp                       | uptime-kuma | /mnt/sdc/uptime-kuma/data                          |                     | status.young-tw.com |
| gitlab/gitlab-ce               | 127.0.0.1:12351->80/tcp                                           | gitlab      |                                                    | postgres            | gitlab.young-tw.com |
| linuxserver/openvscode-serveer | 127.0.0.1:12352->8443/tcp                                         | vscode      |                                                    |                     | code.young-tw.com   |
| joplin/server                  | 127.0.0.1:12353->22300/tcp                                        | joplin      |                                                    |                     | joplin.young-tw.com |
| portainer/portainer-ce         | 127.0.0.1:8000->8000/tcp, :::12359->9000/tcp                      | portainer   |                                                    |                     | admin.young-tw.com  |
| louislam/dockge                | 127.0.0.1:12360->5001/tcp                                         | dockge      |                                                    |                     | dockge.young-tw.com |
