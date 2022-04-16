# Personal script to setup my environment

I was tired to manually installing my environment thousand times, then I created this bash script. I have a Chromebook, so I often build and destroy the Linux container(Crostini), automating this will save me time.

List of required packages to install

* fish
* git
* curl
* wget
* vim file
* github ssh config

List of optional packages to install

* node
* yarn
* docker
* docker-compose
* node/yarn


Command to execute ansible:

  ansible-playbook -i hosts -e @secrets.yml main.yml