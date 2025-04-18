
#!/bin/bash

# Add repositories
sudo apt update && sudo apt upgrade -y
#sudo dpkg --add-architecture i386
sudo apt install curl
sudo apt install gnupg2

echo "Adding repositoy"

#Sublime
#curl -sS https://download.sublimetext.com/sublimehq-pub.gpg |  gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublime.gpg
#echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

#Insomnia
curl -1sLf \
  'https://packages.konghq.com/public/insomnia/setup.deb.sh' \
  | sudo -E distro=ubuntu codename=focal bash

#librewolf
#echo "deb [arch=amd64] http://deb.librewolf.net $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/librewolf.list
#sudo wget https://deb.librewolf.net/keyring.gpg -O /etc/apt/trusted.gpg.d/librewolf.gpg

#kubl
#sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
#echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

#virtualbox
#wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
#wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
#echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bullseye contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list

#vscodium
curl -fSsL https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo gpg --dearmor | sudo tee /usr/share/keyrings/vscodium.gpg >/dev/null
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/vscodium.gpg] https://download.vscodium.com/debs vscodium main" | sudo tee /etc/apt/sources.list.d/vscodium.list
#ansible

#terraform  && packer && vault
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list


echo "Updating system..."
sudo apt update


echo "Installing packages"
while read -r p ; do sudo apt-get install -y $p ; done < <(cat << "EOF"

ansible
apt-file
apt-transport-https
arping
build-essential
ca-certificates
chrome-gnome-shell
chromium
codium
curl
dnsutils
filezilla
firefox-esr
fio
#flameshot
#fluxbox
fonts-powerline
git
#ghostscript
gnome-tweaks
golang
gsmartcontrol
hexchat
hdparm
insomnia
iotop
iperf
keepassxc
#librewolf
linux-cpupower
lm-sensors
locate
lshw
lsscsi
mariadb-client
mtr
#mutt
mycli
ncat
nfs-common
net-tools
network-manager-openvpn-gnome
#nginx
nmap
ntp
nvme-cli
obs-studio
#openbox
#openvpn
packer
peek
perl
postgresql-client
python3
python3-distutils
python3-pip
redis-tools
remmina
rsync
rsyslog
#ruby-full
s3fs
screen
simplescreenrecorder
sysstat
smartmontools
#sublime-merge
#sublime-text
stress
tcpdump
telnet
terminator
terraform
timeshift
tldr
traceroute
thunderbird
tilix
tmux
ufw
vault
vim-gtk3
vlc
#virtualbox-6.1
wget
whois
#wireshark
#wine32
#wine64
zip unzip
zsh
xpad

EOF
)


echo "Done"

echo "Installing Desktop manager"
sudo tasksel install desktop gnome-desktop
sudo apt install task-xfce-desktop
#sudo apt install budgie-desktop

# Clone and setup i3 configuration
echo "Setting up i3 configuration..."
cd $HOME
git clone https://github.com/davidestf/i3-config.git
cd i3-config
chmod +x setup-i3-install.sh
./setup-i3-install.sh



# Change default shell
echo "Changing default shell to zsh..."
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh && \
git clone https://github.com/denysdovhan/spaceship-prompt.git ~/.oh-my-zsh/themes/spaceship-prompt
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
sed -i "s/robbyrussell/agnoster/g" ~/.zshrc
ln -sf ~/.oh-my-zsh/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/themes/spaceship.zsh-theme
#add autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
sudo chsh -s $(which zsh)
sudo source ~/.zshrc

#echo "Installing Packer"

#wget  https://apt.releases.hashicorp.com/gpg
#sudo gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --import gpg
#sudo apt-add-repository "deb [arch=amd64 signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
#sudo apt-get update && sudo apt-get install packer


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
sudo snap install whatsdesk
sudo snap install shortwave
#sudo snap install postman
#sudo snap install --classic eclipse
#sudo snap install --classic code
#sudo snap install discord
#sudo snap install spotify



echo "Installing *DEB package"

#slack
wget https://downloads.slack-edge.com/desktop-releases/linux/x64/4.41.97/slack-desktop-4.41.97-amd64.deb
sudo apt install ./slack-desktop-*.deb

#zoom
curl -LO https://zoom.us/client/latest/zoom_amd64.deb
sudo dpkg -i zoom_amd64.deb

#Kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/Kubectl

#Minikube
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64

#python package
sudo apt install libpq-dev python-dev
sudo pip install pgcli

#jekyll
#sudo gem install jekyll bundler


#wine7
#wget -O - https://dl.winehq.org/wine-builds/winehq.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/winehq.gpg
#sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/debian/ bullseye main'
#sudo apt update
#sudo apt install --install-recommends winehq-stable

# Install Joplin
echo "Installing Joplin..."
wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash

# Configure Vim
echo "Setting up Vim..."
mkdir -p ~/.vim/colors
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
curl -o ~/.vim/colors/molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
cp .vimrc ~/.vimrc
#:PluginInstall

# Ansible plugins:
ansible-galaxy collection install community.general community.mysql

# Add backports
echo "deb http://deb.debian.org/debian $(lsb_release -cs)-backports main contrib non-free" | sudo tee -a /etc/apt/sources.list

#Remove GRUB theme
sudo mv /etc/grub.d/05_debian_theme /etc/grub.d/05_debian_theme.save
sudo update-initramfs -u
sudo update-grub


sudo apt autoremove -y
echo "Installation succeeded!"
