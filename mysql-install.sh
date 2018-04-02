#!/usr/bin/bash
#################################################
#used install mysql
################################################
rm -rf /etc/yum.repos.d/*
curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
yum repolist
yum -y install bash-com* vim-enhan* 
sed -r '/^SELINUX=/cSELINUX=disabled' /etc/selinux/config -i
wget https://repo.mysql.com//mysql57-community-release-el7-11.noarch.rpm
rpm -ivh !$
yum repolist 
yum list |grep mysql-community-server
yum -y install mysql-community-server.x86_64 
systemctl start mysqld
systemctl enable mysqld
pass=`less /var/log/mysqld.log|grep "password is generated" |awk '{print $NF}'`
mysql -u root -p'$pass'
