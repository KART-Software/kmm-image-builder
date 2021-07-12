up:
	vagrant up

build-image:
	vagrant provision --provision-with build-image

ssh:
	vagrant ssh

destroy:
	vagrant destroy