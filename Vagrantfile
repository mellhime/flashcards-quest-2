# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "geerlingguy/centos7"
  config.vm.synced_folder "~/rails_projects/flashcards-quest-2", "/vagrant"
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true
  
    # Customize the amount of memory on the VM:
    vb.memory = "1024"
  end

  config.vm.provision "shell", privileged: false, path: "lib/setupwithrvm.sh"
end
