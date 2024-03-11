#!/bin/bash
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
useradd roboshop
mkdir /app
curl -o /tmp/catalogue.zip https://roboshop-builds.s3.amazonaws.com/catalogue.zip
cd /app 
unzip /tmp/catalogue.zip
npm install 
cp /home/centos/shell/Catalogue.Service /etc/systemd/system/catalogue.service
systemctl daemon-reload
systemctl enable catalogue
systemctl start catalogue
cp /home/centos/shell/mongo.repo /etc/yum.repos.d/mongo.repo
yum install mongodb-org-shell -y
mongo --host 44.204.232.216 </app/schema/catalogue.js
