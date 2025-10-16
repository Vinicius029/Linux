# Comando `chmod` – Alterando Permissões de Arquivos e Diretórios

O comando `chmod` (change mode) é utilizado para **alterar as permissões de acesso** a arquivos e diretórios no Linux.

---

## 🔧 Sintaxe


---

## 🧮 Modo Octal (Numérico)

No modo octal, as permissões são representadas por **números de 0 a 7**, de acordo com a soma de valores atribuídos a cada tipo de permissão:

| Permissão | Valor |
|-----------|-------|
| Leitura (r) | 4   |
| Escrita (w) | 2   |
| Execução (x) | 1  |

A combinação das permissões é feita por soma:

| Permissões | Binário | Valor Octal |
|------------|---------|-------------|
| `---`      | 000     | 0           |
| `--x`      | 001     | 1           |
| `-w-`      | 010     | 2           |
| `-wx`      | 011     | 3           |
| `r--`      | 100     | 4           |
| `r-x`      | 101     | 5           |
| `rw-`      | 110     | 6           |
| `rwx`      | 111     | 7           |

A estrutura numérica segue a ordem: **Proprietário - Grupo - Outros**

---

## 🧪 Exemplos Práticos

### 🔍 Verificando permissões atuais

```bash
ls -l
