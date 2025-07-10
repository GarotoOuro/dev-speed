

sudo apt -y update && sudo apt -y upgrade
# sudo apt install -y git


# check_pgk(){
 #   pkg="$1"
 #   if dpgk -s "$pkg" 2>/dev/null | grep -q 
#}



sudo apt install -y xserver-xorg-core xinit i3 alacritty
sudo apt install -y xserver-xorg-video-ati \
                    xserver-xorg-video-vesa \
                    xserver-xorg-video-fbdev \
                    xserver-xorg-input-libinput


# dpkg -s ()
sudo apt install -y bat
sudo apt install -y tree

sudo sed -i \
  -e 's/^FONTSIZE=.*/FONTSIZE="12x24"/' \
  /etc/default/console-setup


grep -E '^FONTFACE=|^FONTSIZE=' /etc/default/console-setup

# sudo sed -i \
#  -e 's/^FONTFACE=.*/FONTFACE="Terminus"/' \
#  -e 's/^FONTSIZE=.*/FONTSIZE="12x24"/' \
#  /etc/default/console-setup


# grep -E '^FONTFACE=|^FONTSIZE=' /etc/default/console-setup

echo 'exec i3' > ~/.xinitrc

#!/usr/bin/env bash

sudo apt install -y git
sudo apt install -y gh

git clone https://git.suckless.org/st
 # rodar apenas uma vez se nao  existir a pasta e ver outras validacoes

sudo apt install -y make
sudo apt install -y build-essential pkg-config libxft-dev libfontconfig1-dev libfreetype6-dev

# make clean
# make
# sudo make install
# sudo make clean install




sudo cat /home/eng/.local/share/xorg/Xorg.0.log | grep -F EE

sudo apt install -y firefox




