#
# Install these two Vagrant plugins first
#
# vagrant plugin install vagrant-puppet-install
#
#

Vagrant.configure("2") do |config|
  config.vm.box = "debian/contrib-stretch64"
  config.vm.hostname = "php-symfony-vagrant"
  config.puppet_install.puppet_version = :latest
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 8000, host: 8000
  config.vm.network "forwarded_port", guest: 3306, host: 3306
  config.vm.provision "shell", path: "provision.sh"
  config.vm.provider "virtualbox" do |v|
	    v.memory = 2048
	      v.cpus = 2
  end
  config.vm.synced_folder "project/", "/project", type: "virtualbox"
end
