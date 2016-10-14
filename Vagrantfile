# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "ubuntu/trusty64"
	#config.vm.box_url = "http://files.vagrantup.com/precise64.box"
	# Disable automatic box update checking. If you disable this, then
	# boxes will only be checked for updates when the user runs
	# `vagrant box outdated`. This is not recommended.
	# config.vm.box_check_update = false
	config.vm.network "private_network", ip: "192.168.50.5"
	config.vm.network "forwarded_port", guest: 80, host: 8080
    config.vm.network "forwarded_port", guest:8000, host:8001
	config.vm.synced_folder "res/", "/res"
	config.vm.provision "shell", path: "bootstrap.sh"
end

