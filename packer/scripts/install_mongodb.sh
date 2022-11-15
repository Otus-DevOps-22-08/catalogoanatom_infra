#!/bin/sh
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc |  sudo apt-key add - # После пайпа sudo не убрано - а то не отработает добавление ключа
echo "deb [ arch=amd64,arm64 ]  http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt-get update
sleep 60
sudo apt-get install -y apt-transport-https ca-certificates
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -q mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod
sudo systemctl status mongod
