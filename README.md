# ubuntu_workflow
Scripts, aliases, etc. All for automate my or your workflow in Ubuntu

Tested on Ubuntu 22.04 LTS.

Firstly:
```bash

sudo apt remove -y letsencrypt certbot
sudo apt -y install grep ufw fail2ban exa bat terminator git curl wget nginx software-properties-common certbot python3-certbot-nginx docker
sudo apt -y update && sudo apt -y upgrade

cd ~
git clone https://github.com/art610/ubuntu_workflow.git
cd ubuntu_workflow
chmod +x aliases.sh
./aliases.sh
source ~/.bashrc
```
