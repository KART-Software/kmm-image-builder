# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.synced_folder "./", "/vagrant", disabled: false
  config.vm.provision "build-env", type: "shell", :path => "./submodules/packer-builder-arm-image/provision-build-env.sh", privileged: false
  config.vm.provision "install-ansible", type: "shell", :inline => "apt install ansible -y", privileged: true
  config.vm.provision "install-ansible-community-general-collection", type: "shell", :inline => "ansible-galaxy collection install community.general", privileged: true
  config.vm.provision "packer-builder-arm-image", type: "shell", :path => "./submodules/packer-builder-arm-image/provision-packer-builder-arm-image.sh", privileged: false, env: {"GIT_CLONE_URL" => "-b v0.1.6 https://github.com/solo-io/packer-builder-arm-image.git"}
  config.vm.provision "move-packer-builder-arm-image", type: "shell", :inline => "mkdir -p /root/.packer.d/plugins && mv /vagrant/packer-builder-arm-image /root/.packer.d/plugins", privileged: true
  config.vm.provision "build-image", type: "shell", run: "never", :inline => "packer build /vagrant/${PACKERFILE}", privileged: true, env: {"PACKERFILE" => "packer/raspbian.json", "PLAYBOOK_PATH" => "/vagrant/ansible/kmm.yml", "OUTPUT_FILENAME" => "/vagrant/output/kmm.img", "IMAGE_MOUNT_PATH" => "/mnt/kmm", "ANSIBLE_HOST_FILE" => "/vagrant/ansible/hosts.yml"}
end
