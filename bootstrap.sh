#!/usr/bin/env bash

echo "Setting up Ruby on Rails dev environment"
apt-get update > /dev/null 2>&1
echo "Installing curl"
apt-get install -y curl > /dev/null 2>&1
echo "Installing a JavaScript environment"
apt-get install -y nodejs > /dev/null 2>&1
echo "Downloading and Installing RVM"
curl -L https://get.rvm.io | bash -s stable --ruby > /dev/null
source /usr/local/rvm/scripts/rvm
echo "We want a Ruby version >2.0"
echo `ruby -v`
echo "Installing Rails"
gem install rails --no-ri --no-rdoc > /dev/null
echo "We want a Rails version >4.0"
echo `rails -v`
echo "Installing ImageMagick"
apt-get install -y imagemagick > /dev/null 2>&1
echo "Installing redis server"
apt-get install -y redis-server > /dev/null 2>&1
