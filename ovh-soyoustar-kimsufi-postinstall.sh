#!/bin/bash
# postinstall script for ovh plateform ovh.com soyoustart.com and kimsufi.com
cd /root
wget https://raw.githubusercontent.com/amidevous/sentora-installers/master/sentora_install.sh -O /root/sentora_install.sh
chmod +x sentora_install.sh
if [ -f /etc/centos-release ]; then
yum -y update
yum -y remove bind
elif [ -f /etc/lsb-release ]; then
apt-get update
apt-get -y dist-upgrade
fi
./sentora_install.sh -t Europe/Paris -d $(hostname) -i public
wget https://github.com/amidevous/sentora-installers/raw/master/sentora_updater_1.0.3.sh -O /root/sentora_updater_1.0.3.sh
chmod +x sentora_updater_1.0.3.sh
/root/sentora_updater_1.0.3.sh
echo "OK"
exit
