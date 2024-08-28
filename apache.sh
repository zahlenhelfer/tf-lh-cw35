#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
instanceId=$(curl http://169.254.169.254/latest/meta-data/instance-id)
region=$(curl http://169.254.169.254/latest/meta-data/placement/region)
echo "<h1>$instanceId from $region</h1>" > /var/www/html/index.html