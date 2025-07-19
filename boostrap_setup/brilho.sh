 # xrandr --listmonitors
 ## 0: +*eDP 1920/301x1200/188+0+0  eDP
 ## 1: +HDMI-A-0 1920/598x1080/336+1920+0  HDMI-A-0
 ### 1.0 = brilho máximo, 0.5 = bem escuro.


 # Author: Guilherme Gonçalves da Silva (GitHub: GarotoOuro)

set_brightness() {
  BRIGHT="$1"

  if [ -z "$BRIGHT" ]; then
    printf '\033[33m[AVISO]\033[0m Informe o valor de brilho (ex: 0.7)\n' >&2
    return 1
  fi

  # Verifica se o valor está entre 0.1 e 1.0
  case "$BRIGHT" in
    0.*|1.0)
      ;;
    *)
      printf '\033[31m[ERRO]\033[0m Valor inválido: %s. Use um número entre 0.1 e 1.0\n' "$BRIGHT" >&2
      return 1
      ;;
  esac

  xrandr --output eDP --brightness "$BRIGHT"
  xrandr --output HDMI-A-0 --brightness "$BRIGHT"
}



