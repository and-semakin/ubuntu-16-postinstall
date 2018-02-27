#!/bin/bash

# Обновить систему
sudo apt-get -q update
sudo apt-get -y upgrade


# Создать временную папку и перейти в нее
mkdir tmp
cd tmp


# Установить chromium и vlc
echo "*******************************"
echo "******* Chromium & VLC ********"
echo "*******************************"
sudo apt-get -qq update
sudo apt-get -q=2 install -y chromium-browser vlc
echo "Done."
echo ""
echo ""


# Установить fish
echo "*******************************"
echo "********* Fish Shell **********"
echo "*******************************"
sudo apt-get -q=2 install -y fish
chsh -s /usr/bin/fish
echo "Done."
echo ""
echo ""


# Обвновить pip и установить pipenv
echo "*******************************"
echo "*********** Pipenv ************"
echo "*******************************"
sudo apt-get -q=2 install python3-pip
sudo pip3 install --upgrade pip
sudo pip3 install pipenv
echo "Done."
echo ""
echo ""


# Установить qBittorrent
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable
sudo apt-get -qq update
sudo apt-get -q=2 install qbittorrent


# Установить git и httpie
echo "*******************************"
echo "************* git *************"
echo "*******************************"
sudo apt-get -q=2 install git
sudo apt-get -q=2 install httpie
echo "Done."
echo ""
echo ""


# Установить gitkraken
echo "*******************************"
echo "********** GitKraken **********"
echo "*******************************"
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo dpkg -i gitkraken-amd64.deb
echo "Done."
echo ""
echo ""


# Установить docker и docker-compose
echo "*******************************"
echo "*********** Docker ************"
echo "*******************************"
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get -q=2 install -y docker-ce
sudo usermod -aG docker $(whoami)
sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod a+x /usr/local/bin/docker-compose
echo "Done."
echo ""
echo ""


# Установить Node.js
echo "*******************************"
echo "********** Node.js ************"
echo "*******************************"
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
sudo apt-get -q=2 install -y nodejs
echo "Done."
echo ""
echo ""


# Установить VirtualBox
echo "*******************************"
echo "********* VirtualBox **********"
echo "*******************************"
echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee -a /etc/apt/sources.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get -qq update
sudo apt-get -q=2 install -y dkms
sudo apt-get -q=2 install -y virtualbox-5.2
echo "Done."
echo ""
echo ""


# Установить Atom
echo "*******************************"
echo "************ Atom *************"
echo "*******************************"
wget -O atom.deb https://atom.io/download/deb
sudo dpkg -i atom.deb
apm install language-vue-component
apm install atom
echo "Done."
echo ""
echo ""


# Установить umake
echo "*******************************"
echo "************ umake *************"
echo "*******************************"
sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make
sudo apt-get -qq update
sudo apt-get -q=2 install ubuntu-make
echo "Done."
echo ""
echo ""


# Установить unzip
echo "*******************************"
echo "************ unzip ************"
echo "*******************************"
sudo apt-get -q=2 install -y unzip
echo "Done."
echo ""
echo ""


# Установить Telegram
echo "*******************************"
echo "*********** Telegram **********"
echo "*******************************"
wget -O tsetup.tar.xz https://telegram.org/dl/desktop/linux
mkdir ~/.apps
tar xpvf tsetup.tar.xz -C ~/.apps/
~/.apps/Telegram/Telegram
echo "Done."
echo ""
echo ""


# Установить тему Numix
echo "*******************************"
echo "********* Numix theme *********"
echo "*******************************"
sudo apt-get -q=2 install -y unity-tweak-tool
sudo add-apt-repository -y ppa:numix/ppa
sudo apt-get -qq update
sudo apt-get -q=2 install -y numix-gtk-theme numix-icon-theme numix-icon-theme-circle
gsettings set org.gnome.desktop.interface gtk-theme "Numix"
gsettings set org.gnome.desktop.interface icon-theme "Numix-Circle"
gsettings set org.gnome.desktop.interface cursor-theme "DMZ-Black"
echo "Done."
echo ""
echo ""


echo "*******************************"
echo "************* misc ************"
echo "*******************************"
# Отключить "вязкие края"
sudo apt-get -q=2 install -y dconf-tools
dconf write /org/compiz/profiles/unity/plugins/unityshell/launcher-capture-mouse false

# Отключить Bluetooth по умолчанию
sudo systemctl disable bluetooth.service

# Настроить сворачивание окон по клику на иконку в панели запуска
# Minimize on click
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-minimize-window true

# Настроить размер иконок в панели запуска
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ icon-size 36

# Переименовать стандартные директории

echo "Done."
echo ""
echo ""

# Настроить спящий режим на Acer Aspire E1-570G

