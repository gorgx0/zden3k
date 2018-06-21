Vagrant.configure("2") do |config|
  config.vm.box = "debian/stretch64"
  config.puppet_install.puppet_version = :latest
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.provision "shell", path: "provision.sh"
  config.vm.provider "virtualbox" do |v|
	    v.memory = 2048
	      v.cpus = 2
  end
end
