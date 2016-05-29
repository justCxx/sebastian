# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/trusty64'
  config.vm.hostname = 'sebastian-vm'
  config.vm.box_check_update = false

  config.ssh.forward_agent = true

  vm_ip = ENV.fetch 'SEBASTIAN_VM_IP', '192.168.50.20'
  config.vm.network 'private_network', ip: vm_ip

  config.vm.synced_folder '.', '/vagrant', type: 'nfs', mount_options: ['nolock,vers=3,udp']

  config.vm.provider 'virtualbox' do |vb|
    vb.memory = '2048'
  end

  config.vm.provision 'ansible_local' do |ansible|
    ansible.tags = ENV['TAGS']
    ansible.playbook = 'cm/development.yml'
    # ansible.verbose = 'vvvv'
  end
end
