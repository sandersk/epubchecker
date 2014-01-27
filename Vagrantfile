# encoding: utf-8
# This file originally created at http://rove.io/3e2630b6275110ba535b643532084ffa

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "opscode-ubuntu-12.04_chef-11.4.0"
  config.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_chef-11.4.0.box"
  config.ssh.forward_agent = true

  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 8888, host: 8888
  config.vm.network :forwarded_port, guest: 4567, host: 4567
  config.vm.network :private_network, :ip => "10.11.12.13"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks"]
    chef.add_recipe :apt
    chef.add_recipe 'git'
    chef.add_recipe 'ruby_build'
    chef.add_recipe 'rbenv::user'
    chef.add_recipe 'java'
    chef.json = {
      :git   => {
        :prefix => "/usr/local"
      },
      :rbenv => {
        :user_installs => [
          {
            :user   => "vagrant",
            :rubies => [
              "1.9.3-p484"
            ],
	    :gems => {
	      "1.9.3-p484" => [
	      {:name => "bundler",
	       :name => "shotgun"
	      }
	      ]
	    },
            :global => "1.9.3-p484"
          }
        ]
      }
    }
  end

  config.vm.provision :shell, :path => 'box_config/config.sh'
end
