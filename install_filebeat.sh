#!/bin/bash

cd /home/ec2-user

echo "*************Cloning repository..*************"
git clone https://github.com/rajalingarao/11.5.create_ELK_frontend_filebeat.git

cd 11.5.create_ELK_frontend_filebeat

echo "*************Installing node_exporter *************"
sudo sh filebeat/Filebeat.sh || exit 1
echo "************node_exporter-done**************************"

echo "All installations completed successfully."

echo "**************************************"
sudo systemctl status filebeat
echo "**************************************"
sudo netstat -lntp
echo "**************************************"