#!/usr/bin/env dash
set -e

# --- VALIDAÇÃO DE ARGUMENTOS ---
if [ $# -ne 2 ]; then
    echo "Uso: $0 \"Seu Nome\" \"seu@email.com\""
    exit 1
fi

GIT_NAME="$1"
GIT_EMAIL="$2"

# --- CONFIGURAÇÃO GLOBAL DO GIT ---
echo "[✔] Configurando Git com:"
echo "    Nome : $GIT_NAME"
echo "    Email: $GIT_EMAIL"

git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"
git config --global init.defaultBranch main
git config --global credential.helper store

echo "[✔] Git configurado:"
git config --global --list

# --- USAR SSH COMO PADRÃO PARA GITHUB ---
echo "[✔] Configurando Git para usar SSH com GitHub..."
git config --global url."git@github.com:".insteadOf "https://github.com/"

# --- AUTENTICAÇÃO COM GITHUB CLI ---
echo "[✔] Verificando autenticação com GitHub CLI..."
if gh auth status >/dev/null 2>&1; then
    echo "[✔] Já autenticado no GitHub CLI."
else
    echo "[!] Não autenticado no GitHub CLI. Iniciando login..."
    echo "[💡] Você precisará autorizar via navegador."
    gh auth login --hostname github.com --git-protocol ssh --web
fi

echo "[✔] Status da autenticação:"
gh auth status

# --- VERIFICANDO CHAVE SSH ---
echo "[✔] Verificando chave SSH:"
if [ -f "$HOME/.ssh/id_ed25519" ]; then
    ls -l "$HOME/.ssh/id_ed25519"
else
    echo "[❌] Chave ~/.ssh/id_ed25519 não encontrada."
    echo "[💡] Gere com: ssh-keygen -t ed25519 -C \"$GIT_EMAIL\""
fi

# --- GARANTIR github.com NO known_hosts ---
echo "[✔] Garantindo que github.com esteja no known_hosts..."
mkdir -p "$HOME/.ssh"
[ -f "$HOME/.ssh/known_hosts" ] || touch "$HOME/.ssh/known_hosts"
grep -q github.com "$HOME/.ssh/known_hosts" || ssh-keyscan github.com >> "$HOME/.ssh/known_hosts"

