#!/bin/sh

cd ~

sudo yum -y update

sudo yum install -y epel-release

sudo yum install -y python3 gcc nginx git nano java-1.8.0-openjdk-devel wget

sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key

sudo yum upgrade

sudo yum install -y jenkins

sudo systemctl daemon-reload

sudo systemctl start nginx

sudo systemctl enable nginx

sudo systemctl start jenkins

systemctl status jenkins

sudo systemctl enable jenkins