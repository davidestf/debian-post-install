
#!/bin/bash

# Add repositories
sudo apt update && sudo apt upgrade -y
sudo dpkg --add-architecture i386
sudo apt install curl
sudo apt install gnupg2

echo "Adding repositoy"

#Sublime
curl -sS https://download.sublimetext.com/sublimehq-pub.gpg |  gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublime.gpg
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

#Insomnia
echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list
 
#librewolf
echo "deb [arch=amd64] http://deb.librewolf.net $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/librewolf.list
sudo wget https://deb.librewolf.net/keyring.gpg -O /etc/apt/trusted.gpg.d/librewolf.gpg

#kubl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

#virtualbox
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bullseye contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list



echo "Updating system..."
sudo apt update


echo "Installing packages"
while read -r p ; do sudo apt-get install -y $p ; done < <(cat << "EOF"
   
apt-file   
apt-transport-https 
arping 
build-essential
ca-certificates 
chrome-gnome-shell
curl 
dnsutils 
filezilla 
firefox-esr 
flameshot
fluxbox
git 
ghostscript
gnome-tweaks
insomnia 
librewolf
mariadb-client
mtr
mutt
mycli 
net-tools 
nginx 
openbox
openvpn
peek 
perl
postgresql-client
python3
python3-distutils
python3-pip 
redis-tools
remmina 
rsync 
ruby-full
s3fs
screen
simplescreenrecorder 
smartmontools
sublime-merge
sublime-text
tcpdump 
terminator 
traceroute
thunderbird
tilix 
ufw 
vlc
virtualbox-6.1
wireshark
wine32 
wine64
zip unzip
zsh 
xpad 
  
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

echo "Installing Packer"

wget  https://apt.releases.hashicorp.com/gpg
sudo gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --import gpg
sudo apt-add-repository "deb [arch=amd64 signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install packer


# Snap packages
while true; do
    read -p "Do you want to install snap?" yn
    case $yn* in
        [Yy]* ) sudo apt install snap -y && sudo apt install snapd -y; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

sudo snap install zaproxy
sudo snap install whatsdesk
sudo snap install shortwave
sudo snap install postman  
sudo snap install --classic eclipse
#sudo snap install --classic code
#sudo snap install discord
#sudo snap install spotify



echo "Installing *DEB package"

#slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.23.0-amd64.deb
sudo apt install ./slack-desktop-*.deb

#zoom
curl -LO https://zoom.us/client/latest/zoom_amd64.deb
sudo dpkg -i zoom_amd64.deb

#Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb


#python package 
sudo apt install libpq-dev python-dev
sudo pip install pgcli 

#jekyll
sudo gem install jekyll bundler


#wine7
#wget -O - https://dl.winehq.org/wine-builds/winehq.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/winehq.gpg
#sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/debian/ bullseye main'
#sudo apt update
#sudo apt install --install-recommends winehq-stable


#Remove GRUB theme
sudo mv /etc/grub.d/05_debian_theme /etc/grub.d/05_debian_theme.save
sudo update-initramfs -u
sudo update-grub


sudo apt autoremove -y
echo "Installation succeeded!"
