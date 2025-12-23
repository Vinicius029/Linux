# Comando `chgrp` – Alterar o grupo de um arquivo ou diretório

Sintaxe:
- chgrp [novo_grupo] [nome do arquivo]

O comando `change owner` (change owner) Alterar o proprietário de um arquivo ou diretório.

Sintaxe:
chown [novo_proprietario] [nome_arquivo]


---

## 🔧 Sintaxe

* Alterar Proprietário
```bash
sudo chown root index.js
```

* Alterar Grupo
```bash
sudo addgroup javascript
sudo chgrp javascript index.js
ls -l index.js
```
- -rw-rw-rw- 1 root javascript 27 out 15 22:34 index.js



