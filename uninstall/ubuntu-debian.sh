#!/bin/bash
rm -rf /tmp/uninsistall
mkdir -p /tmp/uninsistall
cd /tmp/uninsistall
# mysql and mariadb uninstall all version and remove all database
DEBIAN_FRONTEND=noninteractive apt-get -y purge libdbd-mysql-perl
DEBIAN_FRONTEND=noninteractive apt-get -y purge libmysqlclient20:amd64 
DEBIAN_FRONTEND=noninteractive apt-get -y purge mysql-common
DEBIAN_FRONTEND=noninteractive apt-get -y purge mysql-server
DEBIAN_FRONTEND=noninteractive apt-get -y purge libmariadb3:amd64
DEBIAN_FRONTEND=noninteractive apt-get -y purge mariadb-client-*
DEBIAN_FRONTEND=noninteractive apt-get -y purge mariadb-client-core-*
DEBIAN_FRONTEND=noninteractive apt-get -y purge mariadb-common
DEBIAN_FRONTEND=noninteractive apt-get -y purge mariadb-server
DEBIAN_FRONTEND=noninteractive apt-get -y purge mariadb-server-*
DEBIAN_FRONTEND=noninteractive apt-get -y purge mariadb-server-core-*
DEBIAN_FRONTEND=noninteractive apt-get -y purge mysql-client-*
DEBIAN_FRONTEND=noninteractive apt-get -y purge mysql-client-core-*
DEBIAN_FRONTEND=noninteractive apt-get -y purge mysql-server-*
DEBIAN_FRONTEND=noninteractive apt-get -y purge mysql-server-core-*
DEBIAN_FRONTEND=noninteractive apt-get -y purge mysql-apt-config
DEBIAN_FRONTEND=noninteractive apt-get -y purge mysql-client
DEBIAN_FRONTEND=noninteractive apt-get -y purge mysql-community-client
DEBIAN_FRONTEND=noninteractive apt-get -y purge mysql-community-server
rm -rf /var/lib/mysql/
rm -rf /var/lib/mysql-*
rm -rf /etc/mysql /etc/apt/sources.list.d/mariadb.list
# purge ppa installed packages and remove ppa
apt-get -y install software-properties-common ppa-purge
ppa-purge -y ppa:ondrej/apache2
ppa-purge -y ppa:ondrej/php
add-apt-repository -r -y ppa:ondrej/apache2
add-apt-repository -r -y ppa:ondrej/php
apt-get -y purge software-properties-common ppa-purge
# remove and purge required packages
apt-get -y purge dnsutils
apt-get -y purge wget
apt-get -y purge tzdata
apt-get -y purge sudo
apt-get -y purge vim
apt-get -y purge make
apt-get -y purge zip
apt-get -y purge unzip
apt-get -y purge debconf-utils
apt-get -y purge at
apt-get -y purge build-essential
apt-get -y purge bash-completion
apt-get -y purge ca-certificates
apt-get -y purge e2fslibs
apt-get -y purge bsdutils
apt-get -y purge libsasl2-modules-sql
apt-get -y purge libsasl2-modules
#postfix uninstall and purge packages and config
apt-get -y purge postfix
apt-get -y purge postfix-mysql
rm -rf /etc/postfix/ /var/spool/vacation
deluser vacation
#dovecot uninstall and purge packages and config
apt-get -y purge dovecot-mysql
apt-get -y purge dovecot-imapd
apt-get -y purge dovecot-pop3d
apt-get -y purge dovecot-common
apt-get -y purge dovecot-lmtpd
rm -rf /var/lib/dovecot/sieve/ /etc/dovecot/
#apache and php uninstall and purge packages and config
apt-get -y purge apache2
apt-get -y purge apache2-*
apt-get -y purge libapache2-*
apt-get -y purge libapache2-mod-php5.6
apt-get -y purge php5.6-common
apt-get -y purge php5.6-cli
apt-get -y purge php5.6-mysql
apt-get -y purge php5.6-gd
apt-get -y purge php5.6-mcrypt
apt-get -y purge php5.6-curl
apt-get -y purge php-pear
apt-get -y purge php5.6-imap
apt-get -y purge php5.6-xmlrpc
apt-get -y purge php5.6-xsl
apt-get -y purge php5.6-intl
apt-get -y purge php
apt-get -y purge php-dev
apt-get -y purge php5.6-dev
apt-get -y purge libapache2-mod-php5
apt-get -y purge php5-common
apt-get -y purge php5-cli
apt-get -y purge php5-mysql
apt-get -y purge php5-gd
apt-get -y purge php5-mcrypt
apt-get -y purge php5-curl
apt-get -y purge php-pear
apt-get -y purge php5-imap
apt-get -y purge php5-xmlrpc
apt-get -y purge php5-xsl
apt-get -y purge php5-intl
apt-get -y purge php5-suhosin
apt-get -y purge php5-dev
apt-get -y purge php5.6-*
apt-get -y purge php5.6
apt-get -y purge php5.5
apt-get -y purge php5.5-*
apt-get -y purge php7.0
apt-get -y purge php7.0-*
apt-get -y purge php7.1
apt-get -y purge php7.1-*
apt-get -y purge php7.2
apt-get -y purge php7.2-*
apt-get -y purge php7.3
apt-get -y purge php7.3-*
apt-get -y purge php7.4
apt-get -y purge php7.4-*
apt-get -y purge php5
apt-get -y purge php5-*
apt-get -y purge php
apt-get -y purge php-*
rm -rf /etc/php/ /etc/php5/ /etc/apache2/ /var/lib/php/modules /usr/lib/php
#proftpd uninstall and purge packages and config
apt-get -y purge proftpd-mod-mysql
apt-get -y purge proftpd-*
apt-get -y purge proftpd
rm -rf /etc/proftpd/ 
#bind (named) uninstall and purge packages and config
apt-get -y purge bind9
apt-get -y purge bind9utils
rm -rf /etc/bind/ /var/named
#cron uninstall and purge packages and config
apt-get -y purge cronie
apt-get -y purge crontabs
rm -rf /var/spool/cron/ /etc/cron.d/ /etc/cron /etc/crontabs
#webalizer uninstall and purge packages and config
apt-get -y purge webalizer
#logrotate uninstall and purge packages and config
rm -rf /etc/webalizer/
apt-get -y purge logrotate
rm -rf /etc/logrotate.d/ /etc/logrotate/ /etc/logrotate.conf /etc/logrotate.cnf
#auto remove not removoved packages
apt-get -y --purge autoremove
#reinstall ubuntu-minimal et openssh server
apt-get -y install --reinstall ubuntu-minimal ssh openssh-server
# remove all panel folder and file
rm -rf /etc/sentora /etc/zpanel
rm -rf /var/sentora /var/zpanel
rm -f /root/passwords.txt
