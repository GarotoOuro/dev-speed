#!/bin/bash
set -e

# --- CONFIGURAÇÃO DO GIT ---
GIT_NAME="GarotoOuro"
GIT_EMAIL="ggs.arquivo.2030@gmail.com"

echo "[✔] Configurando Git..."
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"
git config --global init.defaultBranch main
git config --global credential.helper store

echo "[✔] Verificação da configuração do Git:"
git config --global --list

# --- GARANTIR USO DE SSH COMO PADRÃO ---
git config --global url."git@github.com:".insteadOf "https://github.com/"

# --- VERIFICANDO LOGIN GH ---
if gh auth status &>/dev/null; then
    echo "[✔] Já autenticado no GitHub CLI."
else
    echo "[!] Não autenticado no GitHub. Iniciando login via navegador..."
    echo "[💡] Você precisará autorizar o GitHub via navegador (apenas 1 vez)."

    gh auth login --hostname github.com --git-protocol ssh --web
fi

echo "[✔] Status atual:"
gh auth status

echo "[✔] Verificando permission key file."
ls -l ~/.ssh/id_ed25519

echo "[✔] Garantindo que o GitHub esteja no known_hosts..."
[ -f ~/.ssh/known_hosts ] || touch ~/.ssh/known_hosts
grep -q github.com ~/.ssh/known_hosts || ssh-keyscan github.com >> ~/.ssh/known_hosts
