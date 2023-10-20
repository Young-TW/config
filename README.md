# setting of youngtw.net and young-tw.com

| DOCKER IMAGE                | PORTS                                                           | NAMES       | VOLUMES                                            | DOMAIN              |
| --------------------------- | --------------------------------------------------------------- | ----------- | -------------------------------------------------- | ------------------- |
| gitlab/gitlab-ce            | 22/tcp, 443/tcp, 127.0.0.1:12351->80/tcp                        | gitlab      | gitlab-config, gitlab-logs, gitlab-data            | gitlab.young-tw.com |
| matrixdotorg/synapse:latest | 8009/tcp, 8448/tcp, 0.0.0.0:12346->8008/tcp, :::12346->8008/tcp | synapse     | synapse-data                                       | matrix.young-tw.com |
| youngtw/link:latest         | 127.0.0.1:12350->3000/tcp                                       | youngtw_net |                                                    | youngtw.net         |
| youngtw/link:latest         | 127.0.0.1:12348->3000/tcp                                       | link        |                                                    | link.young-tw.com   |
| youngtw/mc-website:latest   | 127.0.0.1:12349->3000/tcp                                       | mc-website  |                                                    | mc.young-tw.com     |
| postgres                    | 5432/tcp                                                        | sql         | /mnt/sdb/db/pgdata                                 |                     |
| youngtw/blog:latest         | 443/tcp, 127.0.0.1:12347->80/tcp                                | blog        |                                                    | blog.young-tw.com   |
| linuxserver/nextcloud       | 80/tcp, 127.0.0.1:12345->443/tcp                                | nextcloud   | /mnt/sdb/nextcloud/data /mnt/sdb/nextcloud/appdata | cloud.young-tw.com  |
| louislam/uptime-kuma:1      | 0.0.0.0:3001->3001/tcp, :::3001->3001/tcp                       | uptime-kuma | /mnt/sdc/uptime-kuma/data                          | status.young-tw.com |