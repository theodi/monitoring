# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |vagrant|

  vms = {
    :monitor => {
      :ip => '192.168.33.10',
      :run_list => [
        "recipe[apt]",
        "recipe[chef-client]"
      ],
      :role => 'monitoring'
    },
    # :test_client => {
    #   :ip => '192.168.33.11',
    #   :run_list => [
    #     "recipe[apt]",
    #     "recipe[icinga::client]"
    #   ]
    # }
  }

  vms.each_pair do |vm_name, vm_options|
    
    vagrant.vm.define vm_name do |config|
    
      config.butcher.knife_config_file = '.chef/knife.rb'

      config.vm.box = "precise64"
      config.vm.network :private_network, ip: vm_options[:ip] if vm_options[:ip]

      config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1024"]
      end

      config.vm.provision :chef_client do |chef|
        chef.node_name              = vm_name.to_s
        chef.environment            = "production"
        chef.chef_server_url        = "https://chef.theodi.org"
        chef.validation_client_name = "chef-validator"
        chef.validation_key_path    = ".chef/chef-validator.pem"
        chef.run_list               = vm_options[:run_list] if vm_options[:run_list]
        chef.add_role                 vm_options[:role] if vm_options[:role]
      end
    
    end    
    
  end
  
end