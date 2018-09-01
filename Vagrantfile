# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.define "SIMILDROID server"
  # Ubuntu box
  config.vm.box = "ubuntu/xenial64"
  config.ssh.forward_agent = true
  # Aprovisionamiento del entorno
  config.vm.provision :shell, path: "install.sh"
  # Redirección de puertos para poder acceder a MySQL y Apache
  config.vm.network "forwarded_port", guest: 80, host: 4567
  config.vm.network "forwarded_port", guest: 3306, host: 3333
  # Carpeta compartida
  config.vm.synced_folder "../SIMILDROID", "/var/www/html/"
  # Provider-specific configuration
  config.vm.provider "virtualbox" do |vb|
    # La máquina virtual no dispondrá de GUI
    vb.gui = false
    # Memoria RAM
    vb.memory = "2048"
  end
end
