# encoding: utf-8
# This file originally created at http://rove.io/da3eacde508cd8f28177af929426d43c

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "lucid64"
  config.vm.box_url = "http://files.vagrantup.com/lucid64.box"

  config.ssh.forward_agent = true

  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 8888, host: 8888
  config.vm.network :forwarded_port, guest: 4567, host: 4567
  config.vm.network :private_network, :ip => "10.11.12.13"


  config.vm.provision :shell, :path => 'provisioning/provision.sh'
end
