#!/usr/bin/env dash
set -e

# --- ARGUMENTOS OPCIONAIS ---
if [ "$#" -eq 2 ]; then
    GIT_NAME=$1
    GIT_EMAIL=$2

    echo "[✔] Configurando Git..."
    git config --global user.name "$GIT_NAME"
    git config --global user.email "$GIT_EMAIL"
    git config --global init.defaultBranch main
    git config --global credential.helper store

    echo "[✔] Verificação da configuração do Git:"
    git config --global --list

    git config --global url."git@github.com:".insteadOf "https://github.com/"
else
    echo "[ℹ] Nenhum argumento fornecido. Pulando configuração do Git."
fi

# --- VERIFICANDO LOGIN GH ---
if command -v gh >/dev/null 2>&1; then
    if gh auth status >/dev/null 2>&1; then
        echo "[✔] Já autenticado no GitHub CLI."
    else
        echo "[!] GitHub CLI não autenticado. Iniciando login via navegador..."
        gh auth login --hostname github.com --git-protocol ssh --web

        if gh auth status >/dev/null 2>&1; then
            echo "[✅] Autenticado com sucesso no GitHub CLI."
        else
            echo "[❌] Falha na autenticação com GitHub CLI."
        fi
    fi

    echo "[✔] Status atual:"
    gh auth status
else
    echo "[⚠] GitHub CLI (gh) não encontrado. Pulei autenticação."
fi

# --- VERIFICANDO CHAVE SSH ---
echo "[✔] Verificando permission key file."
if [ -f "$HOME/.ssh/id_ed25519" ]; then
    ls -l "$HOME/.ssh/id_ed25519"
else
    echo "[❌] Chave SSH não encontrada: ~/.ssh/id_ed25519"
    echo "    ➤ Gere com: ssh-keygen -t ed25519 -C \"seu@email.com\""
fi

# --- GARANTIR github.com NO known_hosts ---
echo "[✔] Garantindo que o GitHub esteja no known_hosts..."
mkdir -p "$HOME/.ssh"
[ -f "$HOME/.ssh/known_hosts" ] || touch "$HOME/.ssh/known_hosts"
grep -q github.com "$HOME/.ssh/known_hosts" || ssh-keyscan github.com >> "$HOME/.ssh/known_hosts"

