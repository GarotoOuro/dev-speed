#!/bin/dash

# Valor padrão se não for passado argumento
P=${1:-20}

# Lê o brilho máximo
MAX=$(cat /sys/class/backlight/amdgpu_bl1/max_brightness)

# Calcula valor real (inteiro)
VAL=$(expr "$MAX" \* "$P" / 100)

# Aplica o valor
echo "$VAL" | sudo tee /sys/class/backlight/amdgpu_bl1/brightness

