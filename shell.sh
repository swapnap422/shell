#!/bin/bash
yum install nginx -y
systemctl enable nginx
systemctl start nginx
rm -rf /usr/share/nginx/html/*
curl -o /tmp/web.zip https://roboshop-builds.s3.amazonaws.com/web.zip
cd /usr/share/nginx/html
unzip /tmp/web.zip
cp /home/centos/shell/roboshop.confg /etc/nginx/default.d/roboshop.conf
systemctl restart nginx 


