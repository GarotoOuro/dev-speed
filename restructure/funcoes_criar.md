linha() { sed -n "$1{p;q}" "$2"; }

linha 5 arquivo.txt

copy2() {
  xclip -selection clipboard
}

copy() {
  printf "%s" "$_" | xclip -selection clipboard
}


paste() {
  xclip -o -selection clipboard
}

gq() {
  git add .
  git commit -m "${1:-update}"
  git push
}

sudo apt install -y xclip

