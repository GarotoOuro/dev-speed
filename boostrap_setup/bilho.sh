#!/bin/dash

# Pega percentual do argumento, padrão 20%
P=${1:-20}

# Lê valor máximo
MAX=$(cat /sys/class/backlight/amdgpu_bl1/max_brightness)

# Calcula brilho absoluto
VAL=$(expr "$MAX" \* "$P" / 100)

# Aplica brilho
echo "$VAL" | sudo tee /sys/class/backlight/amdgpu_bl1/brightness >/dev/null

# Mostra o percentual aplicado
echo "Brilho definido para ${P}%"

