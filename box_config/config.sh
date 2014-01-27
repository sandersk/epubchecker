#!/usr/bin/env bash

# Add .bashrc config settings if not already done
if [ $(grep -c 'cd /vagrant && bundle install' /home/vagrant/.bashrc) -eq 0 ]
then
  echo "Configuring login settings"
  echo -e "\n\ncd /vagrant && bundle install" >> /home/vagrant/.bashrc
else
  echo ".bashrc already configured"
fi

echo "Provisioning complete!"