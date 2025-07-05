sudo apt update && sudo apt upgrade -y

sudo apt install -y dash
sudo dpkg-reconfigure dash
ls -l /bin/sh
chsh -s /bin/dash

sudo apt install -y git
sudo apt install -y gh

sudo apt install tree

sudo apt install --no-install-recommends xserver-xorg xinit i3
sudo apt install -y alacritty

curl -Lo vivaldi.deb "https://downloads.vivaldi.com/stable/vivaldi-stable_6.8.3381.44-1_amd64.deb"

# sudo apt install firefox-esr
source ./scripts/neovim_installer




echo SUCESS THE END


