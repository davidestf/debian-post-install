
#!/bin/bash

# Add repositories
sudo apt update && sudo apt upgrade -y
sudo apt install curl
sudo apt install gnupg2

echo "Adding repositoy"

#Sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

#Insomnia
echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list
 
#kubl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list


echo "Updating system..."
sudo apt update


echo "Installing packages"
while read -r p ; do sudo apt-get install -y $p ; done < <(cat << "EOF"
   
apt-transport-https 
arping 
build-essential
ca-certificates 
curl 
dnsutils 
filezilla 
firefox-esr 
fluxbox
git 
insomnia 
mutt
mycli 
net-tools 
nginx 
openbox
peek 
perl
python3-pip 
remmina 
rsync 
sublime-merge
sublime-text
tcpdump 
terminator 
thunderbird
tilix 
ufw 
wireshark
zip unzip
zsh 
  
EOF
)


echo "Done"

echo "Installing Desktop manager"
sudo tasksel install desktop gnome-desktop
sudo apt install task-xfce-desktop 
sudo apt install budgie-desktop

# Change default shell

echo "Changing default shell to zsh..."
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh && \
git clone https://github.com/denysdovhan/spaceship-prompt.git ~/.oh-my-zsh/themes/spaceship-prompt
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

perl -pi -e "s/robbyrussell/spaceship/g" ~/.zshrc

sudo chsh -s $(which zsh)

ln -sf ~/.oh-my-zsh/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/themes/spaceship.zsh-theme

sudo source ~/.zshrc




# Snap packages
while true; do
    read -p "Do you want to install snap?" yn
    case $yn* in
        [Yy]* ) sudo apt install snap -y && sudo apt install snapd -y; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

#sudo snap install zaproxy
#sudo snap install whatsdesk
#sudo snap install postman  
#sudo snap install --classic eclipse
#sudo snap install --classic code
#sudo snap install discord
#sudo snap install spotify



echo "Installing *DEB package"

#slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb
sudo apt install ./slack-desktop-*.deb

#Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb

sudo apt autoremove -y
echo "Installation succeeded!"



