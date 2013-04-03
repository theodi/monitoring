# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |vagrant|

  vagrant.vm.define :monitor do |config|
    
    config.vm.box = "precise64"
    config.vm.network :private_network, ip: "192.168.33.10"

    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024"]
    end

    config.vm.provision :chef_client do |chef|
      chef.node_name              = "monitor"
      chef.environment            = "production"
      chef.chef_server_url        = "https://chef.theodi.org"
      chef.validation_client_name = "chef-validator"
      chef.validation_key_path    = ".chef/chef-validator.pem"
      chef.run_list               = chef.run_list = [
        "recipe[apt]",
        "recipe[git]",
      ]
    end
    
  end
  
end
