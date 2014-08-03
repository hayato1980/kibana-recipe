# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos6.5"
  config.vm.network :public_network

  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "chef-repo/cookbooks"
    chef.add_recipe "elasticsearch"
    chef.add_recipe "httpd"
    chef.add_recipe "fluentd"
    chef.add_recipe "kibana"
  end

  config.vm.provision :serverspec do |spec|
    spec.pattern = 'spec/*_spec.rb'
  end
end
