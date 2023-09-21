# Setup my environment with Ansible

I was tired to manually installing my environment thousand times, then ~~I created this bash script~~. I took notice of **Ansible** recently and it really helped me to automate my local environment. I have a Chromebook, so I often build and destroy the Linux container(Crostini), automating this will save me time.

List of things that ansible playbook do:

* install and setup fish
* custom config of vim
* git global configs
* github ssh-key add to account
* install docker
* install docker-compose


# Steps

1. Create the python virtual env and install the requirements

	sudo apt install python3-venv python3-pip
	python3 -m venv venv
	source venv/bin/activate
	pip3 install -r requirements.txt

2. I'm using `ansible-valt` to encrypt secrets.yml, for the github token. Create a file `~/.vault_pass` with the password to decrypt.

3. Command to execute ansible:

    ansible-playbook -i hosts -e @secrets.yml main.yml --ask-become-pass

4. (Optional) Point this directory to github git URL

	git init
	git remote add origin git@github.com:MMazoni/install-environment.git
