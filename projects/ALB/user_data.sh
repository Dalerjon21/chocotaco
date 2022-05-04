#!/bin/bash
sudo su
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "Hello to everyone who is learning this and good luck! $(hostname -f)" > /var/www/html/index.html