sudo apt update && sudo apt upgrade -y

sudo apt install -y git
sudo apt install -y gh

sudo apt install tree

sudo apt install --no-install-recommends xserver-xorg xinit i3
sudo apt install -y alacritty
sudo apt install firefox-esr
source ./scripts/neovim_installer

sudo apt install -y dash
sudo dpkg-reconfigure dash
ls -l /bin/sh
chsh -s /bin/dash
sudo apt remove --purge bash


echo SUCESS THE END


