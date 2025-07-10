sudo apt install -y wget

wget https://github.com/wez/wezterm/releases/download/20240203-110809-5046fc22/wezterm-20240203-110809-5046fc22.Ubuntu22.04.deb

sudo dpkg -i wezterm-20240203-110809-5046fc22.Ubuntu22.04.deb
sudo apt -f install  # corrige dependências se faltar algo

