# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.host_name = "precise32"

  config.vm.network "private_network", ip: "192.168.50.4"
  config.vm.network "forwarded_port", guest: 22,   host: 2222, id: "ssh"
  config.vm.network "forwarded_port", guest: 80,   host: 8080, id: "web"
  config.vm.network "forwarded_port", guest: 5432, host: 5433, id: "psql"
# config.vm.network "forwarded_port", guest: 3306, host: 3307, id: "mysql"
  
  config.vm.synced_folder ".", "/vagrant", :mount_options => ["dmode=777","fmode=666"]

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet"
    puppet.module_path = "puppet/modules"
    puppet.manifest_file = "base.pp"
  end
end