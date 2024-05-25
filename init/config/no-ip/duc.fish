#!/usr/bin/env fish

change_dir /usr/local/src/
if not wget http://www.noip.com/client/linux/noip-duc-linux.tar.gz
    echo "Failed to download no-ip duc"
    exit 1
end
tar xf noip-duc-linux.tar.gz
change_dir noip-2.1.9-1/
if not make install
    echo "Failed to install no-ip duc"
    exit 1
end
