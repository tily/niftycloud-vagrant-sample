vagrant up
vagrant ssh-config --host=jenkingrant > vagrant-ssh.conf
bundle
bundle exec knife solo bootstrap jenkingrant -F vagrant-ssh.conf
bundle exec rake ci:setup:rspec spec
rm -f vagrant-ssh.conf
vagrant destroy -f
