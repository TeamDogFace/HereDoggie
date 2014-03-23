#!/usr/bin/env bash

echo "Setting up Ruby on Rails dev environment"
apt-get update >/dev/null 2>&1
echo "Installing curl"
apt-get install -y curl
echo "Installing a JavaScript environment"
apt-get install -y nodejs
echo "Downloading and Installing RVM"
curl -L https://get.rvm.io | bash -s stable --ruby
source /usr/local/rvm/scripts/rvm
echo "We want a Ruby version >2.0"
echo `ruby -v`

echo "Installing Rails"
gem install rails --no-ri --no-rdoc
echo "We want a Rails version >4.0"
echo `rails -v`

