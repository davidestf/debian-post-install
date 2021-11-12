
#!/bin/bash

# Install required packages for complete installation

while true; do
    read -p "Do you want to install snap?" yn
    case $yn* in
        [Yy]* ) sudo apt install snap -y && apt install snapd -y; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Add repositories

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

# Update system

echo "Updating system..."

sudo apt update && sudo apt upgrade -y
sudo apt autoremove -y

# Standard packages

echo "Installing standard packages..."

sudo apt install \
apt-transport-https \
build-essential \
ca-certificates \
curl \
dnsutils \
arping \
tcpdump \
git \
net-tools \
nginx \
ufw \
python3-pip \
zsh \
filezilla \
insomnia \
thunderbird \
remmina \
arping \
rsync \
tcpdump \
build-essential \
#vim-enhanced \
rsync \
mycli \
peek \
terminator \
tilix \
firefox \
thunderbird

echo "Done"
echo "Installing developer tools..."

sudo apt install openjdk-11-jdk openjdk-11-doc openjdk-11-source -y
sudo apt install neovim -y
sudo apt install sublime-text -y
sudo apt install sublime-merge -y

# Snap packages

echo "Installing snap packages..."

sudo snap install zaproxy
sudo snap install whatsdesk
sudo snap install postman  
sudo snap install --classic eclipse
sudo snap install --classic code
sudo snap install discord
sudo snap install spotify

# Change default shell

echo "Changing default shell to zsh..."
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh && \
git clone https://github.com/denysdovhan/spaceship-prompt.git ~/.oh-my-zsh/themes/spaceship-prompt
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

perl -pi -e "s/robbyrussell/spaceship/g" ~/.zshrc

chsh -s $(which zsh)

ln -sf ~/.oh-my-zsh/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/themes/spaceship.zsh-theme

source ~/.zshrc


echo "Installing *DEB package"

#slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb
sudo apt install ./slack-desktop-*.deb

#Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb

echo "Installation succeeded!"

#etc
