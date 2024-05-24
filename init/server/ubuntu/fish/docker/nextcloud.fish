cd ~
mkdir nextcloud
cd nextcloud || exit
mkdir appdata
mkdir data

docker pull linuxserver/nextcloud:latest

docker run -d \
  --name=nextcloud \
  -e TZ=Etc/UTC+8 \
  -p 127.0.0.1:12345:443 \
  -v /path/to/appdata:/home/young/config \
  -v /path/to/data:/home/young/data \
  --restart unless-stopped \
  linuxserver/nextcloud:latest