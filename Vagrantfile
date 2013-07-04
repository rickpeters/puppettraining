Vagrant::Config.run do |config|
  config.vm.box = "lucid32"
  config.vm.forward_port 8080, 3080
  config.vm.forward_port 80, 3000
  #config.vm.network :hostonly, "192.168.56.10"
  config.vm.provision :puppet do |puppet|
    puppet.module_path = "modules"
    puppet.options = "--verbose"
    puppet.facter = {
     "vagrant" => "1",
     "ricky" => "blabla",
    }
  end
end
