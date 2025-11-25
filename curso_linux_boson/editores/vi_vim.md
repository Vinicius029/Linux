# VIM / VI – Atalhos Essenciais 

---

## 1. Modos do VIM

- **Normal mode** → modo padrão (navegar, apagar, copiar, etc.)
- **Insert mode** → digitar texto
- **Visual mode** → selecionar texto
- **Command-line mode** → comandos iniciados com `:`, `/`, `?`

### Entrar em **INSERT mode** (a partir do modo normal)

- `i` → insere **antes** do cursor  
- `a` → insere **depois** do cursor  
- `I` → insere no **início da linha**  
- `A` → insere no **fim da linha**  
- `o` → abre **nova linha abaixo** e entra em insert  
- `O` → abre **nova linha acima** e entra em insert  
- `s` → apaga caractere atual e entra em insert  
- `S` → apaga **linha inteira** e entra em insert  
- `ciw` → apaga a palavra sob o cursor e entra em insert  

**Sair do modo INSERT**:  
- `Esc`

---

## 2. Comandos básicos (salvar, sair, arquivos)

No **modo normal**, digite `:` para entrar em modo de comando:

- `:w` → salvar arquivo  
- `:q` → sair  
- `:wq` → salvar e sair  
- `:x` → salvar e sair (similar a `:wq`)  
- `:q!` → sair **sem salvar**  
- `:w nome_arquivo` → salvar como outro arquivo  
- `ZZ` → salvar e sair (atalho, sem `:`)  
- `ZQ` → sair sem salvar  

---

## 3. Navegação pelo texto

### Movimentos básicos (modo normal)

- `h` → esquerda  
- `j` → baixo  
- `k` → cima  
- `l` → direita  

### Navegação por palavras

- `w` → início da **próxima palavra**  
- `e` → **fim da palavra** atual/próxima  
- `b` → início da **palavra anterior**  
- `ge` → fim da **palavra anterior**  

Com número antes:  
- `3w` → avança 3 palavras  
- `2b` → volta 2 palavras  

### Navegação na linha

- `0` → início da linha  
- `^` → primeiro caractere **não em branco** da linha  
- `$` → fim da linha  

### Navegação no arquivo

- `gg` → início do arquivo  
- `G` → fim do arquivo  
- `nG` → ir para a linha `n` (ex: `10G`)  
- `:n` → ir para a linha `n` (ex: `:10`)  

### Navegação por página

- `Ctrl + f` → página para frente (page down)  
- `Ctrl + b` → página para trás (page up)  
- `Ctrl + d` → meia página para baixo  
- `Ctrl + u` → meia página para cima  

---

## 4. Deletar, copiar e colar (delete, yank, paste)

> **operador + movimento**

Operadores principais:
- `d` → delete (apaga)  
- `y` → yank (copia)  
- `c` → change (apaga e entra em insert)  

### Deletar

- `x` → apaga caractere sob o cursor  
- `X` → apaga caractere **antes** do cursor  
- `dw` → apaga do cursor até o **fim da palavra**  
- `diw` → apaga a **palavra inteira** sob o cursor  
- `dd` → apaga **linha inteira**  
- `2dd` → apaga 2 linhas  
- `d$` → apaga do cursor até o **fim da linha**  
- `d0` → apaga do cursor até o **início da linha**  
- `D` → igual a `d$`  

### Copiar (yank)

- `yy` → copia linha inteira  
- `2yy` → copia 2 linhas  
- `yw` → copia da posição atual até o fim da palavra  
- `yiw` → copia a **palavra inteira**  
- `y$` → copia do cursor até o **fim da linha**  

### Colar (paste)

- `p` → colar **depois** do cursor ou **abaixo** da linha  
- `P` → colar **antes** do cursor ou **acima** da linha  

### Desfazer / Refazer

- `u` → desfazer (undo)  
- `Ctrl + r` → refazer (redo)  

---

## 5. Busca e navegação por buscas

### Buscar texto

- `/texto` → busca **para frente**  
- `?texto` → busca **para trás**  
- `n` → próximo resultado  
- `N` → resultado anterior  

Exemplo:
```vim
/linux
n   "vai para o próximo 'linux'"
N   "vai para o anterior"
