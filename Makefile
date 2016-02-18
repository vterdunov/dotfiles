install-ansible:
	sudo apt-get install software-properties-common
	sudo apt-add-repository ppa:ansible/ansible
	sudo apt-get update
	sudo apt-get install ansible

common-software:
	ansible-playbook common-software.yml -i local --ask-sudo-pass

TAGS := always
development:
	ansible-playbook development.yml -i local --ask-sudo-pass --tags $(TAGS)

install-dotfiles:
	ansible-playbook dotfiles.yml -i local --ask-sudo-pass
