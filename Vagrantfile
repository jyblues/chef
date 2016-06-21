# -*- mode: ruby -*-
# vi: set ft=ruby :

def define_machine_name(config, name)
  config.vm.provider "virtualbox" do |v|
  v.name = name
end
end

Vagrant.configure("2") do |config|
  config.vm.define :chef_server, primary: true do |cfg|
    cfg.vm.box = "base"
    cfg.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-7.2_chef-provisionerless.box"
    cfg.vm.network :private_network, ip: "192.168.30.10"
    cfg.vm.host_name = "chef_server"

    define_machine_name cfg, "chef_server"
  end
  config.vm.define :workstation do |cfg|
    cfg.vm.box = "base"
    cfg.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-7.2_chef-provisionerless.box"
    cfg.vm.network :private_network, ip: "192.168.30.20"
    cfg.vm.host_name = "workstation"

    define_machine_name cfg, "workstation"
  end
  config.vm.define :node01 do |cfg|
    cfg.vm.box = "base"
    cfg.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-7.2_chef-provisionerless.box"
    cfg.vm.network :private_network, ip: "192.168.30.21"
    cfg.vm.host_name = "node01"

    define_machine_name cfg, "node01"
  end
  config.vm.define :node02 do |cfg|
    cfg.vm.box = "base"
    cfg.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-7.2_chef-provisionerless.box"
    cfg.vm.network :private_network, ip: "192.168.30.22"
    cfg.vm.host_name = "node02"

    define_machine_name cfg, "node02"
  end
  config.vm.define :node03 do |cfg|
    cfg.vm.box = "base"
    cfg.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-7.2_chef-provisionerless.box"
    cfg.vm.network :private_network, ip: "192.168.30.23"
    cfg.vm.host_name = "node03"

    define_machine_name cfg, "node03"
  end
end