#!/bin/bash

echo " "
echo "Installation script for ZeeDesigns"
apt update
apt upgrade
echo " "
echo "If kernel updates were installed please press CTRL-C and reboot"
read -n 1 -s

echo "Change root password"
passwd

sed -i 's/ubuntu/zeedesigns/' /etc/hosts
sudo apt install openjdk-11-jdk
wget https://github.com/thingsboard/thingsboard/releases/download/v3.2.2/thingsboard-3.2.2.deb
sudo dpkg -i thingsboard-3.2.2.deb
sudo apt install -y wget vim mlocate

#Postgres
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add
RELEASE=$(lsb_release -cs)
echo "deb http://apt.postgresql.org/pub/repos/apt/ ${RELEASE}"-pgdg main | sudo tee  /etc/apt/sources.list.d/pgdg.list
sudo apt update
sudo apt -y install postgresql-12
sudo service postgresql start
