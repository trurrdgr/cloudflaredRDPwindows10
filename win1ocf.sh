#!/bin/bash

# Download and set up cloudflared
wget -O cloudflared-linux-amd64 https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64
chmod +x cloudflared-linux-amd64

# Run Cloudflare tunnel
./cloudflared-linux-amd64 tunnel --url http://localhost:8080 --label test >cf.txt

# Run Docker container with NoMachine
docker run --rm -d --network host --privileged --name nomachine-xfce4 -e PASSWORD=123456 -e USER=user --cap-add=SYS_PTRACE --shm-size=1g thuonghai2711/nomachine-ubuntu-desktop:windows10

clear
echo "NoMachine: https://www.nomachine.com/download"
echo "Done! NoMachine Information:"
echo "IP Address:"
./cloudflared-linux-amd64 tunnel list | grep -oP '(?<=URL: http:\/\/).*$'
echo "User: user"
echo "Passwd: 123456"
echo "VM can't connect? Restart Cloud Shell then re-run the script."

# Countdown timer
seq 1 43200 | while read i; do
    echo -en "\r Running .     $i s / 43200 s"
    sleep 0.1
    echo -en "\r Running ..    $i s / 43200 s"
    sleep 0.1
    echo -en "\r Running ...   $i s / 43200 s"
    sleep 0.1
    echo -en "\r Running ....  $i s / 43200 s"
    sleep 0.1
    echo -en "\r Running ..... $i s / 43200 s"
    sleep 0.1
    echo -en "\r Running     . $i s / 43200 s"
    sleep 0.1
    echo -en "\r Running  .... $i s / 43200 s"
    sleep 0.1
    echo -en "\r Running   ... $i s / 43200 s"
    sleep 0.1
    echo -en "\r Running    .. $i s / 43200 s"
    sleep 0.1
    echo -en "\r Running     . $i s / 43200 s"
    sleep 0.1
done
