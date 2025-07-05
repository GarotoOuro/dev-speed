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

