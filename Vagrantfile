# -*- mode: ruby -*-
# # vi: set ft=ruby :

# Basically following the default installation instructions:
# http://docs.docker.io/en/latest/installation/ubuntulinux/
$script = <<SCRIPT
  apt-get -y install git curl
  curl https://get.docker.io/gpg | apt-key add -
  echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list
  apt-get -y update
  apt-get -y install lxc-docker linux-image-generic-lts-raring linux-headers-generic-lts-raring
  reboot
SCRIPT

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'precise64'
  # This box comes with a docker ready kernel: http://www.vagrantbox.es/
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'
  config.vm.provision 'shell', inline: $script
end
