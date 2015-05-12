#!/usr/bin/env bash
# deploy on CentOS-6

# 1.Download and install rvm and ruby
curl -L https://get.rvm.io | bash -s stable
sed -i 's!ftp.ruby-lang.org/pub/ruby!ruby.taobao.org/mirrors/ruby!' $rvm_path/config/db

sudo yum install git-core libmysqlclient-dev openssl bzip2 bzip2-devel
sudo yum install -y gcc ruby-devel zlib-devel libxml2

# install mysql
sudo rpm -e --nodeps mysql
sudo yum install -y mysql-server mysql mysql-deve
sudo service mysqld start
sudo chkconfig mysqld on
sudo mysqladmin -u root password '1234'
 # install the latest RVM stable release
rvm 2.1.4

# install node 
wget http://nodejs.org/dist/v0.12.2/node-v0.12.2.tar.gz
tar -zvxf node-v0.12.2.tar.gz
cd node-v0.12.2
sudo make & make install 
# upgrade 

# install python
# wget http://www.python.org/ftp/python/2.7.3/Python-2.7.3.tgz
# tar -xf Python-2.7.3.tgz
# cd Python-2.7.3
# ./configure
# make
# make altinstall
# sudo mv /usr/bin/python /usr/bin/python_
# sudo ln -s /usr/local/bin/python2.7 /usr/bin/python

 # change gem sources
gem sources --remove https://rubygems.org/
gem sources -a http://ruby.taobao.org/

 # install sqlite3 gem
gem install bundle --no-rdoc --no-ri
bundle config build.libv8 --with-system-v8

 # download Nginx
mkdir /etc/yum.repos.d/nginx.repo 
  # [nginx]
  # name=nginx repo
  # baseurl=http://nginx.org/packages/centos/$releasever/$basearch/
  # gpgcheck=0
  # enabled=1
yum install nginx
sudo mkdir /etc/nginx/sites-available  /etc/nginx/sites-enabled
sudo touch /etc/nginx/sites-available/deploy.conf
sudo ln -sf /etc/nginx/sites-available/deploy.conf /etc/nginx/sites-enabled/deploy.conf

# Add group and some user
# useradd focinfi
# passwd focinfi
# groupadd admin
# usermod -G admin focinfi


# Set ssh

cd /root/
mkdir .ssh
# scp /Users/mac/.ssh/id_rsa.pub root@192.168.1.181:/root/.ssh/authorized_keys #for root

# scp /Users/mac/.ssh/id_rsa.pub focinfi@192.168.1.181:/root/.ssh/authorized_keys #for focinfi
chmod 600 /root/.ssh/authorized_keys # change permissions 110-000-000


# Configure ssh
vi /etc/ssh/ssh_config

# example
# Port 13579 
# ListenAddress 192.168.1.1 #inner ip or external ip or host name
# HostKey /etc/ssh/ssh_host_key
# ServerKeyBits 1024
# LoginGraceTime 600
# KeyRegenerationInterval 3600
# PermitRootLogin no
# IgnoreRhosts yes
# IgnoreUserKnownHosts yes
# StrictModes yes
# X11Forwarding no
# PrintMotd yes
# SyslogFacility AUTH
# LogLevel INFO
# RhostsAuthentication no
# RhostsRSAAuthentication no
# RSAAuthentication yes
# PasswordAuthentication yes
# PermitEmptyPasswords no
# StrictHostKeyChecking no #add ip and machine into /root/.ssh/know_hosts 
# AllowUsers focinfi

service sshd start #start ssh
chkconfig sshd on #start automatically 

# Change user
# su focinfi

# Deploy with mina
# add mina in Gemfile
  # gem 'mina'

# mina install
  
# add user and domain and set rvm
  # set :user, "focinfi"
  # set :domain, '42.96.137.114'
  # set :deploy_to, '/var/www/learnDeploy'
  # set :repository, 'git://github.com/Focinfi/LearnDeploy.git'
  # set :branch, 'master'
  
  # invoke :'rvm:use[ruby-2.0.0-p598@default]'
  
# add dir in server
  # mkdir /var/www/learnDeploy
  # mkdir /home/focinfi

# change ownership to focinfi
  # chown -R admin:focinfi /var/www/learnDeploy
  # chown -R admin:focinfi /home/focinfi
  
# mina setup

# edit /var/www/learnDeploy/shared/config/database.yml

# mina deploy









