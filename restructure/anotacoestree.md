# comandos tree

tree -L 2 ~ # level de recursividade
tree -Lp 2 ~ # permissoes
tree -Li 2 ~ # laste name de todos na mesma lista nao importando o level de recursividade


tree 
L 2	 # level de recursividade
p   	 # permissoes
i	 # somente os nomes finais, desativa caracteres graficos
a 	 # inclui ocultos
f 	 # mostra o path relativo
F        # add / nos diretorios
h        # size
D        # data update
u	 # user onwer
g        # group
noreport # remove o texto do resumo no final


# poderoso find 
find . -type f


Perfeito. Aqui está um **manual minimalista e poderoso de `find`**, feito para **uso direto no terminal**, com foco em clareza, memorização e praticidade.

---

## 🧠 **FIND — MANUAL MINIMALISTA**

---

### 🔍 1. **Listar todos os arquivos**

```sh
find . -type f
```

### 📁 2. **Listar todos os diretórios**

```sh
find . -type d
```

---

### 🎯 3. **Filtrar por nome (globs)**

```sh
find . -name '*.c'          # arquivos .c
find . -name 'main*'        # começa com "main"
find . -iname '*.jpg'       # ignorando maiúsculas
```

---

### 🧹 4. **Excluir caminhos**

```sh
find . -type f -not -path './.git/*'
```

---

### ⏱ 5. **Filtrar por tempo**

```sh
find . -type f -mtime -1    # modificados há menos de 1 dia
find . -type f -mmin -60    # modificados há menos de 60 min
```

---

### 📦 6. **Executar comando por arquivo**

```sh
find . -name '*.sh' -exec chmod +x {} \;
```

* `{} =` o arquivo
* `\; =` fim do comando

---

### ❌ 7. **Deletar arquivos diretamente**

```sh
find . -name '*.tmp' -delete
```

---

### 🔄 8. **Listar com nomes separados por NULL (para scripts)**

```sh
find . -type f -print0 | xargs -0 ...
```

---

### 🎛 9. **Limitar profundidade**

```sh
find . -maxdepth 1          # só no diretório atual
find . -mindepth 2          # ignora o topo
```

---

### 🧠 DICA MENTAL:

```
find <onde> <condições> <ação>
```

Exemplo prático:

```sh
find . -type f -name '*.log' -mtime +7 -delete
# Apaga logs com mais de 7 dias
```

---

### ⚡ Quer personalizar mais?

Posso montar um `alias` ou script para encurtar qualquer padrão desses (ex: `ff '*.c'` para `find . -name '*.c'`).

Se quiser PDF, cartão de memorização ou cheatsheet, também posso montar.


Se você quer **procurar conteúdo dentro dos arquivos**, e dominar uma ferramenta **completamente poderosa**, a escolha ideal é:

---

## ✅ **`grep`** — A ferramenta que casa com `find`

---

### 🧠 DOMINE `grep` PARA CONTEÚDO, COMO DOMINA `find` PARA ARQUIVOS

---

## 📌 MANUAL MINIMALISTA DO `grep`

---

### 🔍 1. **Buscar texto em arquivos**

```sh
grep 'palavra' arquivo.txt
```

### 🔁 2. **Buscar recursivamente**

```sh
grep -r 'palavra' .
```

### 📝 3. **Mostrar número da linha**

```sh
grep -n 'palavra' arquivo.txt
```

### 🧠 4. **Ignorar maiúsculas/minúsculas**

```sh
grep -i 'palavra' arquivo.txt
```

### 📄 5. **Mostrar só nomes de arquivos que contêm**

```sh
grep -rl 'palavra' .
```

### ❌ 6. **Mostrar arquivos que **não** contêm**

```sh
grep -L 'palavra' *.txt
```

### 🧵 7. **Usar regex poderoso**

```sh
grep -E 'erro|fail|fatal' log.txt
```

---

## 🔥 COMBO FIND + GREP (máximo poder)

### 🔎 Buscar palavra em todos `.c`:

```sh
find . -name '*.c' -exec grep -Hn 'main' {} \;
```

### 🔎 Buscar ignorando `.git`:

```sh
find . -type f -not -path '*/.git/*' -exec grep -H 'TODO' {} \;
```

---

## 🧠 FRASE MENTAL:

```
grep = CONTEÚDO
find = LOCALIZAÇÃO
```

---

Se quiser, posso montar um **manual grep + find** consolidado, com exemplos de casos reais (logs, scripts, código-fonte, etc). Deseja?



Sim — **você está absolutamente certo**. `grep` e `find` são **fundamentais**, mas **não bastam sozinhos** se seu objetivo for **dominar busca de conteúdo real** em um sistema complexo ou em código.

Se a ideia é ir **além**, aqui está a análise sincera e técnica:

---

## ✅ O TRIO IDEAL: `find`, `grep` e **`ripgrep` (`rg`)**

### Por que o `grep` puro **não é suficiente**:

* Não ignora `.gitignore` por padrão
* É lento em árvores grandes
* Não tem destaque de sintaxe
* Regex simples (a não ser que use `-E`, `-P`, etc.)

---

## 🔥 A FERRAMENTA QUE COMPLETA TUDO: `ripgrep` (`rg`)

> `rg` é o **substituto moderno de `grep`**, feito em Rust, e é **extremamente rápido**, respeita `.gitignore`, e tem **integração perfeita com editores**.

---

### ✅ Por que dominar `rg` em vez de `grep`

| Recurso                | `grep`           | `rg` (ripgrep) |
| ---------------------- | ---------------- | -------------- |
| Velocidade             | Lento            | Muito rápido   |
| Suporte a `.gitignore` | ❌                | ✅              |
| Recursivo por padrão   | ❌ (precisa `-r`) | ✅              |
| Regex avançado         | Parcial          | Total (`PCRE`) |
| Cores/sintaxe bonitos  | ❌                | ✅              |

---

## 🎯 Exemplos com `rg`:

```sh
rg 'main'              # busca "main" em tudo, ignora .git e binários
rg 'TODO' src/         # busca só em src/
rg --files-with-matches 'printf'    # só mostra arquivos que têm
rg -C 3 'error'        # mostra 3 linhas de contexto antes e depois
```

---

### 🧠 Combo mental:

* `find` → onde está o **arquivo**
* `rg` → o que tem **dentro** (rápido, respeita ignore, regex de verdade)

---

## 📌 Conclusão para uso sério:

### Se você quer:

* Dominar **busca de arquivos** → `find`
* Fazer **busca rápida de conteúdo simples** → `grep`
* Ter **poder total, velocidade e modernidade** → **`ripgrep (rg)`**

---

### ⚙️ Instalação do `rg`:

No Ubuntu/Debian:

```sh
sudo apt install ripgrep
```

No Arch:

```sh
sudo pacman -S ripgrep
```

---

Quer que eu monte um **manual de domínio de `rg`** como fiz com o `find`?


O `rg` (**ripgrep**) é uma ferramenta de linha de comando que serve para **buscar conteúdo dentro de arquivos**, com **alta velocidade** e **mais inteligência** que `grep`.

---

## ✅ O que o `rg` faz (e faz muito bem):

### 🔍 1. **Busca texto dentro de arquivos recursivamente**

```sh
rg 'main'
```

* Busca em todos os arquivos do diretório atual e subdiretórios
* É **rápido** porque usa algoritmos otimizados (feito em Rust)

---

### 📂 2. **Ignora arquivos inúteis automaticamente**

* Ignora:

  * `.git/`
  * `.gitignore`
  * `node_modules/`, `*.class`, `*.o` etc

> ⚠️ Isso evita ruído — você vê só o que importa

---

### 🧠 3. **Aceita regex poderoso**

```sh
rg 'funcao[0-9]+'      # regex de funções tipo funcao1, funcao2
rg '^#'                # linhas que começam com #
```

---

### 🔍 4. **Mostra número da linha + destaque**

```sh
rg -n 'erro'
```

* `-n`: mostra o número da linha
* Colorido por padrão
* Pode mostrar **contexto**:

```sh
rg -C 2 'falhou'       # mostra 2 linhas antes e depois
```

---

### 🗂 5. **Buscar só em certos arquivos**

```sh
rg 'main' --glob '*.c'
rg 'import' --type py
```

> Usa glob ou até **detecção automática de linguagens**

---

### 📄 6. **Mostrar só nomes dos arquivos que têm o texto**

```sh
rg -l 'TODO'
```

---

### ❌ 7. **Excluir pastas da busca**

```sh
rg 'main' --ignore-dir build
```

---

### 🔥 8. **Busca com performance absurda**

Mesmo em projetos com **milhares de arquivos**, `rg` responde em **milissegundos**.

---

## ✅ Em resumo:

| Função                        | `rg` faz? | Exemplo                 |         |
| ----------------------------- | --------- | ----------------------- | ------- |
| Buscar palavra em projeto     | ✅         | `rg palavra`            |         |
| Regex avançado                | ✅         | \`rg 'erro              | fail'\` |
| Ignorar `.git`, `build/`, etc | ✅         | automático              |         |
| Buscar só em `.c`             | ✅         | `rg 'foo' --glob '*.c'` |         |
| Mostrar linha + arquivo       | ✅         | `rg -n 'foo'`           |         |
| Mostrar só arquivos com match | ✅         | `rg -l 'bar'`           |         |
| Mostrar contexto              | ✅         | `rg -C 3 'falha'`       |         |

---

Se quiser um **manual minimalista com exemplos reais** pra memorizar, posso montar na mesma pegada do `find`. Deseja?



Entendo **exatamente** o que você quer dizer.

Você está buscando um **sistema de comandos que juntos te deem poder total sobre o filesystem** — algo equivalente a um **CRUD completo de arquivos via terminal**, não só "buscar".

Buscar com `find` e `rg` cobre **só o "R" (Read/search)**.

---

## 💥 O que está faltando:

Você quer um **CRUD de verdade**:

* **C**: Criar arquivos/diretórios
* **R**: Ler conteúdo / buscar
* **U**: Atualizar / editar / modificar
* **D**: Deletar com controle total

E quer isso **tudo na linha de comando**, de forma **eficiente, memorável e poderosa** — sem depender de ferramentas gráficas ou scripts complicados.

---

## 🧠 O CRUD UNIX COMPLETO (manual mental definitivo)

### ✅ 1. **Create (Criar)**

```sh
mkdir pasta/
touch arquivo.txt
cp origem destino
```

### ✅ 2. **Read (Ler/Buscar)**

```sh
find . -type f                     # Localizar arquivos
rg 'palavra'                       # Buscar conteúdo
less arquivo.txt                   # Ver conteúdo com paginação
head -n 10 arquivo.txt             # Ver começo
tail -n 10 arquivo.txt             # Ver final
```

### ✅ 3. **Update (Modificar)**

```sh
vim arquivo.txt                    # Editar manualmente
sed -i 's/foo/bar/g' arquivo.txt   # Substituir texto direto
chmod +x script.sh                 # Alterar permissões
mv nome_antigo novo_nome          # Renomear
```

### ✅ 4. **Delete (Remover)**

```sh
rm arquivo.txt
rm -r pasta/
find . -name '*.tmp' -delete       # Apagar por padrão
```

---

## 🔧 Ferramentas que cobrem tudo:

| Ação       | Comando(s) principais       | Extra poderoso?          |
| ---------- | --------------------------- | ------------------------ |
| Criar      | `touch`, `mkdir`, `cp`      | `install`, `tee`         |
| Ler/Buscar | `find`, `rg`, `less`, `cat` | `xargs`, `grep -C`, `jq` |
| Atualizar  | `vim`, `sed`, `mv`, `chmod` | `awk`, `patch`           |
| Deletar    | `rm`, `find -delete`        | `trash-cli`, `shred`     |

---

## 🧠 Combinações reais de poder

### 🔁 Buscar arquivos `.c` com TODO e torná-los executáveis:

```sh
find . -name '*.c' -exec rg 'TODO' {} \; -exec chmod +x {} \;
```

### ❌ Deletar arquivos `.log` com erro dentro:

```sh
rg -l 'ERROR' --glob '*.log' | xargs rm
```

### ✏️ Substituir palavra em todos `.txt`:

```sh
find . -name '*.txt' -exec sed -i 's/foo/bar/g' {} \;
```

---

## ✅ Veredito:

Você quer **um conjunto de comandos Unix que substitua ferramentas gráficas e IDEs** para tudo: listar, buscar, modificar e apagar. A base ideal pra isso é:

> `find` + `rg` + `sed` + `xargs` + `vim` + `rm`

Esse combo cobre **tudo** que se faz com arquivos: **criar, encontrar, inspecionar, editar e destruir**.

---

Quer que eu monte uma **folha de referência CRUD terminal.pdf**, só com isso resumido e pronto pra decorar?





| Ação       | Comando(s) principais       | Extra poderoso?          |
| ---------- | --------------------------- | ------------------------ |
| Criar      | `touch`, `mkdir`, `cp`      | `install`, `tee`         |
| Ler/Buscar | `find`, `rg`, `less`, `cat` | `xargs`, `grep -C`, `jq` |
| Atualizar  | `vim`, `sed`, `mv`, `chmod` | `awk`, `patch`           |
| Deletar    | `rm`, `find -delete`        | `trash-cli`, `shred`     |


