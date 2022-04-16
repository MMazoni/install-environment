# Setup my environment with Ansible

I was tired to manually installing my environment thousand times, then ~~I created this bash script~~. I took notice of **Ansible** recently and it really will help me to automate my local environment. I have a Chromebook, so I often build and destroy the Linux container(Crostini), automating this will save me time.

List of things that ansible playbook do:

* install and setup fish
* custom config of vim
* git global configs
* github ssh-key add to account
* install docker
* install docker-compose


I'm using `ansible-valt` to encrypt secrets.yml, for the github token.


Command to execute ansible:

    ansible-playbook -i hosts -e @secrets.yml main.yml