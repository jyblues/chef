# -*- mode: ruby -*-
# vi: set ft=ruby :

def define_machine_name(config, name)
  config.vm.provider "virtualbox" do |v|
    v.name = name
  end
end

# 1. Ruby install
# 2. get a git
$script = <<SCRIPT
yum install -y git-core rubygems
cd ~
git clone https://github.com/jyblues/chef.git
sudo chmod +x ./chef/gameserver.sh
sudo chmod +x ./chef/test.sh
sudo chmod +x ./chef/install_ruby_and_chef.sh
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.define :game_server, primary: true do |cfg|
    cfg.vm.box = "base"
    cfg.vm.box_url = "https://f0fff3908f081cb6461b407be80daf97f07ac418.googledrive.com/host/0BwtuV7VyVTSkUG1PM3pCeDJ4dVE/centos7.box"
    cfg.vm.network "public_network", ip: "192.168.219.200"
    define_machine_name cfg, "game_server"

    cfg.vm.provision "shell", inline: $script
  end
end
