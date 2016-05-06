# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.provider "virtualbox" do |v|
    v.name = "Coq_Emacs_ProofGeneral"
    v.gui = true
    v.memory = "4096"
  end
  config.ssh
  config.vm.provision "shell", path: "init_as_root.sh", privileged: true
  config.vm.provision "shell", path: "init_as_user.sh", privileged: false
end
