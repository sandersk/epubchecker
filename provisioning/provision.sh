#!/usr/bin/env bash

# Install Java on machine...

JAVA_INSTALLED=$(java > /dev/null 2> /dev/null; echo $?)
RVM_INSTALLED=$(rvm > /dev/null 2> /dev/null; echo $?)
CURL_INSTALLED=$(curl --help > /dev/null 2> /dev/null; echo $?)

if [ $JAVA_INSTALLED -ne 0 ]
then
  echo "Java not installed. Installing Java"
  echo "-----------------------------------"
  apt-get -y install sun-javadb-client
else
  echo "Java already installed"
fi

# Install curl for RVM if needed...
if [ $CURL_INSTALLED -ne 0 ]
then
  echo "curl not installed. Installing curl"
  echo "-----------------------------------"
  apt-get -y install curl
else
  echo "curl already installed"
fi

# Install RVM on machine...

if [ $RVM_INSTALLED -ne 0 ]
then
  echo "rvm not installed. Installing rvm"
  echo "---------------------------------"
  curl -sSL https://get.rvm.io | bash
  source /usr/local/rvm/scripts/rvm
  rvm use --install "1.9.3"
else
  echo "rvm already installed"
fi

# Add .bashrc config settings if not already done
if [ $(grep -c 'rvm use 1.9.3; cd /vagrant && bundle install' /home/vagrant/.bashrc) -eq 0 ]
then
  echo "Configuring login settings"
  echo -e "\n\nrvm use 1.9.3; cd /vagrant && bundle install" >> /home/vagrant/.bashrc
else
  echo ".bashrc already configured"
fi

echo "Provisioning complete!"