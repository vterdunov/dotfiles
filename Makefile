install_ansible:
	sudo apt-get install software-properties-common
	sudo apt-add-repository ppa:ansible/ansible
	sudo apt-get update
	sudo apt-get install ansible

install_common-software:
	ansible-playbook common-software.yml -i local -K


TAGS := always

install_development:
	ansible-playbook development.yml -i local -K --tags $(TAGS)

install_dotfiles:
	ansible-playbook dotfiles.yml -i local -K
