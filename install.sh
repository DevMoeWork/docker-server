#!/bin/bash
apt-get install git
curl -fsSL https://get.docker.com/ | sudo sh
sudo usermod -aG docker $USER

curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/sbin/docker-compose
chmod +x /usr/sbin/docker-compose

service docker start
docker version
docker-compose version

git clone https://github.com/DevMoeWork/docker-server ./devel
cd devel

# 기본 디렉토리 생성
mkdir ./sources/
mkdir ./sources/mariadb/
mkdir ./sources/web/
mkdir ./sources/default/
mkdir ./settings/
mkdir ./settings/apache/
mkdir ./settings/apache/conf-enabled/
mkdir ./settings/php/
mkdir ./settings/vhosts/

# 파일 복사
cp ./samples/.env ./.env
cp ./samples/docker-compose.yml ./docker-compose.yml

# 아파치쪽 작업
cp ./samples/apache/apache2.conf ./settings/apache/apache2.conf
cp ./samples/apache/ports.conf ./settings/apache/ports.conf
cp ./samples/apache/security.conf ./settings/apache/conf-enabled/security.conf
cp ./samples/apache/000-default.conf ./settings/vhosts/000-default.conf
cp ./samples/apache/index.html ./sources/default/index.html

# PHP 작업
cp ./samples/php/php.ini ./settings/php/php.ini

docker-compose build