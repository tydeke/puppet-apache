# Puppet Apache Exercise
Automated deployment of an Apache web server using Vagrant and Puppet.

## Prerequisites
The following must be installed on the machine running the code
1. [Hashicorp Vagrant](https://www.vagrantup.com/downloads)
2. [Virtualbox](https://www.virtualbox.org/wiki/Downloads)

## Platform(s)
Tested on Ubuntu 18.04.5 Bionic Beaver.

## Usage
In this example, an Ubuntu virtual machine is spun up by Vagrant. Puppet is installed on the virtual machine and an Apache web server is deployed using the [Puppet Apply Provisioner](https://www.vagrantup.com/docs/provisioning/puppet_apply) and [Puppet Apache Module](https://forge.puppet.com/modules/puppetlabs/apache). After a successful run, Apache will display a simple "Hello world" message on port 8080. 

Please note the default port forwarding from guest to host below in the **Vagrantfile**
```vagrant
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 80, host: 8081
```  

To start, use `vagrant up` from the puppet-apache directory to execute the commands in the VagrantFile.

To access the virtual machine use `vagrant ssh`

## Apache Configuration

Apache Web Server configuration is handled through the **default.pp**. To deploy an Apache web server and accept all defaults of the Apache Puppet module please reference the section [Begining with Apache](https://forge.puppet.com/modules/puppetlabs/apache#beginning-with-apache).

default.pp file
```puppet
class { 'apache':
  default_vhost => false,
  }
  apache::vhost { 'tyler.com':
    servername  => 'tyler',
    port        => '8080',
    docroot     => '/var/www/html',
  } 
  file { 'hello_world.html':
    path    => '/var/www/html/index.html',
    content => '<html><body><h1>Hello World</h1></body></html>',
  }
```
For example, to change the port from 8080 to 80, simply change the port value in the **default.pp**. Save the file and run `vagrant provision` from the host machine. The default port of apache will now be port 80.
