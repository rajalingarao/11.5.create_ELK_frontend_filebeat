#!/bin/bash

cd /home/ec2-user

echo "****Cloning repository..**11.5.create_ELK_frontend_filebeat****"
git clone https://github.com/rajalingarao/11.5.create_ELK_frontend_filebeat.git

cd 11.5.create_ELK_frontend_filebeat

echo "******Installing Filebeat - start*********"
sudo sh filebeat/Filebeat.sh || exit 1
echo "************Filebeat - done*************"

echo "All installations completed successfully."

echo "***********filebeat status - start **************"
sudo systemctl status filebeat
echo "***********filebeat status - done ****************"
sudo netstat -lntp
echo "**************filebeat port***************"