# -*- mode: ruby -*-
# vi: set ft=ruby :

require "yaml"

y = YAML.load File.open ".chef/rackspace_secrets.yaml"

Vagrant.configure("2") do |vagrant|

  vms = {
    :monitor => {
      :run_list => [
        "recipe[apt]",
        "recipe[icinga::client]",
        "recipe[chef-client::config]",
        "recipe[chef-client]",
        "role[monitoring]"
      ]
    },
    :'test-icinga-client' => {
      :run_list => [
        "recipe[apt]",
        "recipe[icinga::client]",
        "recipe[chef-client::config]",
        "recipe[chef-client]"
      ]
    }
  }

  vms.each_pair do |vm_name, vm_options|
    
    vagrant.vm.define vm_name do |config|
    
      config.butcher.knife_config_file = '.chef/knife.rb'

      config.vm.hostname = vm_name.to_s

      # Virtualbox
      config.vm.box               = "precise64"
      config.vm.network :private_network, ip: vm_options[:ip] if vm_options[:ip]
      config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "512"]
      end

      # Rackspace
      # config.ssh.private_key_path = "./.chef/id_rsa"
      # config.ssh.username         = "root"
      # config.vm.box               = "dummy"
      # config.vm.provider :rackspace do |rs|
      #   rs.username                 = y["username"]
      #   rs.api_key                  = y["api_key"]
      #   rs.flavor                   = /512MB/
      #   rs.image                    = /Precise/
      #   rs.public_key_path          = "./.chef/id_rsa.pub"
      #   rs.endpoint                 = "https://lon.servers.api.rackspacecloud.com/v2"
      #   rs.auth_url                 = "lon.identity.api.rackspacecloud.com"
      # end
      # config.vm.provision :shell, :inline => "curl -L https://www.opscode.com/chef/install.sh | bash"

      config.vm.provision :chef_client do |chef|
        chef.node_name              = vm_name.to_s
        chef.environment            = "production"
        chef.chef_server_url        = "https://chef.theodi.org"
        chef.validation_client_name = "chef-validator"
        chef.validation_key_path    = ".chef/chef-validator.pem"
        chef.run_list               = vm_options[:run_list] if vm_options[:run_list]
      end
    
    end    
    
  end
  
end