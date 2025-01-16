#!/bin/bash
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
cd /var/www/html
echo '<html><h1>This is Web Server 1</h1></html>' > index.html