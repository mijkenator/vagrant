#!/bin/bash

echo "Provisioning virtual machine..."

#echo "Fixing sudo"
#sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile

export DEBIAN_FRONTEND=noninteractive
sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8
dpkg-reconfigure locales

# Git
echo "Installing Git"
sudo apt-get install git -y > /dev/null  2>&1

# Nginx
echo "Installing Nginx"
sudo apt-get install nginx -y > /dev/null  2>&1


# Erlang && Elixir
cd /tmp && wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && dpkg -i sudo erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt-get update
sudo apt-get install esl-erlang -y
sudo apt-get install elixir -y

### PHP
#echo "Updating PHP repository"
#apt-get install python-software-properties build-essential -y > /dev/null
#add-apt-repository ppa:ondrej/php5 -y > /dev/null
#apt-get update > /dev/null
##
#echo "Installing PHP"
#apt-get install php5-common php5-dev php5-cli php5-fpm -y > /dev/null
##
#echo "Installing PHP extensions"
#apt-get install curl php5-curl php5-gd php5-mcrypt php5-mysql -y > /dev/null
##
#
### MySQL 
echo "Preparing MySQL"
sudo apt-get install debconf-utils -y > /dev/null 2>&1
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password 1234"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password 1234"
##
echo "Installing MySQL"
sudo apt-get install mysql-server -y > /dev/null  2>&1
##
### Nginx Configuration
#echo "Configuring Nginx"
#cp /var/www/provision/config/nginx_vhost /etc/nginx/sites-available/nginx_vhost > /dev/null
#ln -s /etc/nginx/sites-available/nginx_vhost /etc/nginx/sites-enabled/
##
#rm -rf /etc/nginx/sites-available/default
##
### Restart Nginx for the config to take effect
#service nginx restart > /dev/null
##
#
echo "Install 1"
sudo apt-get -f install -y
sudo apt-get install tig -y
sudo apt-get install ncurses-dev -y
sudo apt-get build-dep vim -y
sudo apt-get install python-pip -y
sudo apt-get install exuberant-ctags -y
sudo apt-get install mc -y
sudo apt-get install python3-pip -y
sudo apt-get install python3-dev python-dev cmake build-essential -y
sudo apt-get -f install -y
echo "Install 2"
sudo apt-get install ctags -y
sudo pip install git+git://github.com/Lokaltog/powerline
## git keys, vim, vim configs
cp /var/www/provision/config/config /home/ubuntu/.ssh/ > /dev/null
cp /var/www/provision/config/id_rsa_wp* /home/ubuntu/.ssh/ > /dev/null
cp /var/www/provision/config/gkey* /home/ubuntu/.ssh/ > /dev/null
chown ubuntu:ubuntu /home/ubuntu/.ssh/*
cp /var/www/provision/vim/.vimrc /home/ubuntu
cp /var/www/provision/vim/.viminfo /home/ubuntu
cp -r /var/www/provision/vim/.vim /home/ubuntu
chown ubuntu:ubuntu /home/ubuntu/.vimrc
chown ubuntu:ubuntu /home/ubuntu/.viminfo
chown -R ubuntu:ubuntu /home/ubuntu/.vim
cp /var/www/provision/tmux/.tmux.conf /home/ubuntu
#
wget https://raw.github.com/wiki/rebar/rebar/rebar && chmod +x rebar
sudo mv rebar /usr/bin
wget https://s3.amazonaws.com/rebar3/rebar3 && chmod +x rebar3
sudo mv rebar3 /usr/bin

sudo apt-get -f install -y
sudo apt-get install nodejs-legacy nodejs -y
sudo apt-get install npm -y
sudo apt-get install memcached -y
#
echo "Finished provisioning."
#
