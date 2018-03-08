# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    config.vm.provider :virtualbox do |vb|
        # change the network card hardware for better performance
        vb.customize ["modifyvm", :id, "--nictype1", "virtio" ]
        vb.customize ["modifyvm", :id, "--nictype2", "virtio" ]

        # suggested fix for slow network performance
        # see https://github.com/mitchellh/vagrant/issues/1807
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]

        vb.customize ["modifyvm", :id, "--vram", "64"]
        vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
        vb.memory = 4096
    end

    config.vm.box = "olbat/tiny-core-micro"
    config.disksize.size = '120GB'

    config.vm.define "ubuntu" do |config|
        config.vm.network :private_network, ip: "10.0.0.100"
    end
    config.vm.hostname = 'ubuntu'
    config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
end

