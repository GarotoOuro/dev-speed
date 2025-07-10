Perfeito. Abaixo está um **guia prático e minimalista** de como editar arquivos em múltiplos diretórios usando **apenas o Vim clássico**, sem plugins, ideal para engenheiros como você que querem **velocidade e domínio total**.

---

## 🧭 GUIA: Edição de arquivos em vários diretórios com Vim puro

---

### 📁 **1. Abrindo arquivos de diferentes pastas**

```sh
vim pasta1/main.c pasta2/utils.c pasta3/include/config.h
```

Dentro do Vim:

```vim
:next        " Vai para o próximo arquivo
:prev        " Volta para o anterior
```

---

### 🗂️ **2. Editar arquivos com caminho relativo ou absoluto**

```vim
:e ../outros/modulo.c
:e ~/projetos/foo/bar.c
```

---

### 📂 **3. Mudar de diretório dentro do Vim**

```vim
:cd src/
:e modulo.c
```

Ver onde você está:

```vim
:pwd
```

Voltar ao diretório anterior:

```vim
:cd -
```

---

### 🧠 **4. Usar `args` e `argdo` com globs para editar em lote**

**Exemplo: editar todos os `.c` do projeto**

```vim
:args **/*.c
:argdo %s/foo/bar/g | update
```

* `args` → carrega arquivos como argumentos
* `argdo` → executa comandos em todos os arquivos

---

### 📚 **5. Trabalhar com buffers**

```vim
:e pasta1/a.c
:e pasta2/b.c
:e pasta3/c.c
```

Listar todos os arquivos abertos (buffers):

```vim
:ls
```

Alternar entre eles:

```vim
:bn    " Próximo buffer
:bp    " Buffer anterior
:b 2   " Ir direto ao buffer 2
:bd    " Fechar buffer atual
```

---

### 📐 **6. Usar `:split` ou `:vsplit` para ver arquivos lado a lado**

```vim
:split pasta1/a.c
:vsplit pasta2/b.c
```

Mover entre janelas:

```vim
<C-w>h   " esquerda
<C-w>l   " direita
<C-w>j   " abaixo
<C-w>k   " acima
```

---

### 🧰 **7. Usar macros e comandos ex para automações rápidas**

Gravar macro:

```vim
qq:s/foo/bar/g<CR>q
```

Repetir macro:

```vim
@q
```

---

### 🧪 **8. Criar um atalho para abrir arquivos com `find`**

No shell:

```sh
vim $(find . -name '*.c')
```

---

## ✅ Conclusão

Com esse conjunto de comandos, você pode:

* **Abrir centenas de arquivos** sem plugin
* **Editar em lote**
* **Navegar por diretórios**
* **Trabalhar com múltiplos arquivos em paralelo**
* **Ficar 100% no Vim puro**

---

Se quiser, posso te montar um `.vimrc` minimalista para reforçar isso e evitar plugins modernos. Deseja?

