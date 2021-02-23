# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

# Configure Virtual Machine 
Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 80, host: 8081
  
# Install Puppet Agent
  config.vm.provision "shell", inline: <<-SHELL
  if [ ! -f /opt/puppetlabs/bin/puppet ]; then
        wget -nc https://apt.puppetlabs.com/puppet5-release-bionic.deb
        sudo dpkg -i puppet5-release-bionic.deb
        sudo apt update
        sudo apt-get install -y puppet-agent
    fi
  SHELL
  
#Provisioning with Puppet modules
  config.vm.provision "puppet" do |puppet|
    puppet.module_path = "modules"
  end
end

