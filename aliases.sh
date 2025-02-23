#!/bin/bash  

# Define aliases  
declare -A ALIASES=(  
    ["c"]="clear"  
    ["r"]="bat"  
    ["se"]="sudo nano"
    ["sev"]="sudo vim"
    ["e"]="nano"
    ["ev"]="vim"
    ["h"]="history"  
    ["j"]="jobs -l"  
    ["p"]="sudo ss -tuln"  
    ["l"]="exa -lag"  
    ["s"]="grep --color=auto -i"  
    ["+x"]="sudo chmod +x"
    ["-x"]="sudo chmod -x"
    ["+i"]="sudo chattr +i"
    ["-i"]="sudo chattr -i"
    ["eb"]="nano ~/.bashrc"  
    ["ab"]="source ~/.bashrc"  
    ["certs"]="sudo certbot certificates"  
    ["md"]="mkdir -pv"  
    ["rd"]="sudo rm -R"  
    ["pd"]="cd /home/art610/Documents/projects"  
    ["hd"]="cd /home/art610"  
    ["su"]="sudo su"  
    ["root"]="sudo su"  
    ["apti"]="sudo apt -y install"
    ["aptu"]="sudo apt --yes update && sudo apt --yes upgrade"  
    ["aptr"]="sudo apt -y remove --purge"
    ["lsof"]="sudo lsof -i -P -n"  
    ["df"]="df -H"  
    ["du"]="du -ch"  
    ["free"]="free -h"  
    ["ln"]="ln -is"  
    ["sizes"]="du --summarize --human-readable *"  
    ["sshk"]="ssh-keygen -t ed25519 -a 64"  
    ["sshc"]="nano ~/.ssh/config"  
    ["ssh"]="ssh -o IdentitiesOnly=yes"  
    ["ufwl"]="sudo ufw status"  
    ["certm"]="sudo certbot certonly --preferred-challenges=dns --agree-tos --manual --server https://acme-v02.api.letsencrypt.org/directory -m <CHANGE TO YOUR EMAIL> -d <CHANGE TO YOUR DOMAIN>"  
    ["certn"]="sudo certbot renew --nginx"  
    ["gita"]="git add ."
    ["giti"]="git init"
    ["gitc"]="git commit -m "
    ["gitcl"]="git clone "
    ["gitremote"]="git remote add origin "
    ["gitu"]="git pull origin main"
    ["gitp"]="git push -u origin "
    ["gitpm"]="git push -u origin main"
    ["gitrm"]="git rm --cached "
    ["gitrd"]="git rm -r --cached "
    ["gitd"]="git diff"
    ["gits"]="git status"
    ["gitl"]="git log"
    ["gitlg"]="git log --graph"
    ["gitb"]="git branch -a"
    ["gitch"]="git checkout -b "
    ["gitm"]="git merge "
    ["postgres"]="sudo su - postgres"  
    ["nginxr"]="sudo systemctl reload nginx"  
    ["nginxs"]="sudo systemctl status nginx"  
    ["nginxc"]="sudo nano /etc/nginx/nginx.conf"  
    ["celerye"]="sudo systemctl edit celery"  
    ["celeryr"]="sudo systemctl restart celery"  
    ["celerys"]="sudo systemctl status celery"  
    ["flowere"]="sudo systemctl edit flower"  
    ["flowerr"]="sudo systemctl restart flower"  
    ["flowers"]="sudo systemctl status flower"  
    ["redisr"]="sudo systemctl restart redis"  
    ["rediss"]="sudo systemctl status redis"  
    ["dockerup"]="docker compose up -d --build"  
    ["dockerd"]="docker compose down"  
    ["dockerp"]="docker compose pull"  
    ["dockerr"]="docker compose restart"  
    ["dockerps"]="docker compose ps"  
    ["dockerl"]="docker-compose logs"  
    ["dockerm"]="nano docker-compose.yml"  
    ["awesomec"]="nano ~/.config/awesome/rc.lua" 
)  

# Add aliases to the bashrc file  
for alias in "${!ALIASES[@]}"; do  
    if ! grep -q "alias $alias=" ~/.bashrc; then  
        echo "alias $alias='${ALIASES[$alias]}'" >> ~/.bashrc  
    else  
        echo "Alias $alias already exists in ~/.bashrc, skipping..."  
    fi  
done  

# Inform the user to source the bashrc file  
echo "Aliases added. Please run 'source ~/.bashrc' to apply the changes."  
