install-ansible:
	sudo apt-get install software-properties-common
	sudo apt-add-repository -y ppa:ansible/ansible
	sudo apt-get update
	sudo apt-get install -y ansible

install-common-software:
	ansible-playbook common-software.yml -i local --ask-sudo-pass

TAGS := always
install-development:
	ansible-galaxy install --force -r requirements.yml 
	ansible-playbook development.yml -i local --ask-sudo-pass --tags $(TAGS) -vv

install-dotfiles:
	ansible-playbook dotfiles.yml -i local --ask-sudo-pass
