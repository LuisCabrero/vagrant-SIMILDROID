# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.define "SIMILDROID server"
  # Every Vagrant development environment requires a box.
  config.vm.box = "ubuntu/xenial64"
  # Provisioning the environment
  config.vm.provision :shell, path: "install.sh"
  # Port redirect to access ports from the host machine.
  config.vm.network "forwarded_port", guest: 80, host: 4567
  # Share an additional folder to the guest VM.
  config.vm.synced_folder "../SIMILDROID", "/var/www/html"
  # Provider-specific configuration
  config.vm.provider "virtualbox" do |vb|
    # Do not display the VirtualBox GUI when booting the machine
    vb.gui = false
    # Customize the amount of memory on the VM:
    vb.memory = "2048"
  end
end
