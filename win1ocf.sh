#!/bin/bash

function goto {
    label=$1
    cd
    cmd=$(sed -n "/^:[[:blank:]][[:blank:]]*${label}/{:a;n;p;ba};" $0 |
          grep -v ':$')
    eval "$cmd"
    exit
}

# Download and set up cloudflared
wget -O cloudflared-linux-amd64 https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 > /dev/null 2>&1
chmod +x cloudflared-linux-amd64

# Run cloudflared tunnel
clear
echo "Repo: https://github.com/kmille36/Docker-Ubuntu-Desktop-NoMachine"
echo "======================="
echo "Choose Cloudflare tunnel region (for better connection)."
echo "======================="
echo "europe-west1 - Europe West (Frankfurt)"
echo "us-east1 - US East (South Carolina)"
echo "ap-northeast1 - Asia Pacific (Tokyo)"
echo "us-west1 - US West (San Francisco)"
read -p "Choose Cloudflare tunnel region: " CRP
./cloudflared-linux-amd64 tunnel --url http://localhost:4040 &> cf.txt &
sleep 1

# Run Docker container with NoMachine
docker run --rm -d --network host --privileged --name nomachine-xfce4 -e PASSWORD=123456 -e USER=user --cap-add=SYS_PTRACE --shm-size=1g thuonghai2711/nomachine-ubuntu-desktop:windows10

clear
echo "NoMachine: https://www.nomachine.com/download"
echo "Done! NoMachine Information:"
echo "IP Address:"
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
