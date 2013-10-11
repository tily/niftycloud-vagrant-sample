Vagrant.configure("2") do |config|
  config.vm.box = "dummy"

  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true
  config.vm.provision :chef_solo do |chef|
    chef.run_list = [
      "hello",
      "mysql::client",
      "mysql::server",
      "tmux"
    ]
    chef.json = {
      mysql: {
        server_root_password: "password",
        server_repl_password: "password",
        server_debian_password: "password",
        bind_address: "127.0.0.1"
      }
    }
  end

  config.vm.provider :niftycloud do |niftycloud, override|
    niftycloud.access_key_id = ENV["NIFTY_CLOUD_ACCESS_KEY"] || ""
    niftycloud.secret_access_key = ENV["NIFTY_CLOUD_SECRET_KEY"] || ""
    niftycloud.image_id = "15799"
    #niftycloud.key_name = "sshkey001_private.pem"
    niftycloud.key_name = "sshkey001"
    niftycloud.password = "sshkey001"
    override.ssh.username = "vagrant"
    override.ssh.private_key_path = "vagrant.id_rsa"

    niftycloud.zone = 'west-11'
    niftycloud.firewall = 'testfw'
  end
end
