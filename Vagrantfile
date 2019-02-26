# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  config.vm.provider "virtualbox" do |v|
    v.name = "super-inspire-end"
  end

  config.vm.box_check_update = false
  config.vm.synced_folder ".", "/opt"

  config.vm.provider "virtualbox" do |vb|
  # Display the VirtualBox GUI when booting the machine
    vb.gui = false
    vb.memory = "1024"
  end

  config.vm.network "private_network", ip: "192.168.66.66"

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y docker.io docker-compose git

    docker pull yonh/inspire_flask
    docker pull redis
    docker pull catone/inspire:nginx
    docker pull catone/inspire:centos7
    docker pull ubuntu:18.04
    docker pull ubuntu:16.04

    git clone https://github.com/super-inspire/super-inspire-end.git
    cd super-inspire-end/
    ./init.sh
    #docker-compose up -d
    usermod -aG docker vagrant
  SHELL
end
