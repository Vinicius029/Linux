# Entendendo o Comando `ls -l` no Linux

O comando `ls -l` exibe uma listagem detalhada dos arquivos e diretórios em um diretório no sistema Linux. A saída inclui informações como permissões, número de links, proprietário, grupo, tamanho, data de modificação e nome do arquivo/diretório.

## Exemplo de saída


### Campos explicados

| Campo         | Significado                                                       |
|---------------|-------------------------------------------------------------------|
| Permissão     | Tipo de arquivo + permissões para proprietário, grupo e outros    |
| Link          | Número de links (referências) para o arquivo/diretório            |
| Proprietário  | Dono do arquivo/diretório                                         |
| Grupo         | Grupo ao qual o arquivo/diretório pertence                        |
| Tamanho       | Tamanho do arquivo em bytes                                       |
| Data e Hora   | Data e hora da última modificação                                 |
| Nome          | Nome do arquivo ou diretório                                      |

---

## Tipos de Arquivos (primeiro caractere da permissão)

| Letra | Tipo de Arquivo         |
|-------|--------------------------|
| `-`   | Arquivo comum            |
| `d`   | Diretório                |
| `l`   | Link simbólico           |
| `c`   | Arquivo de caractere     |
| `b`   | Arquivo de bloco         |

---

## Permissões (rwx)

As permissões são divididas em três grupos de três caracteres:

1. **Proprietário**
2. **Grupo**
3. **Outros (usuários restantes)**

Cada grupo de três caracteres representa:

| Letra | Permissão   |
|-------|-------------|
| `r`   | Leitura     |
| `w`   | Escrita     |
| `x`   | Execução    |
| `-`   | Sem permissão correspondente |

### Exemplo: `drwxrwxr-x`

| Tipo | Proprietário | Grupo | Outros |
|------|--------------|-------|--------|
| `d`  | `rwx`        | `rwx` | `r-x`  |

- É um diretório (`d`)
- Proprietário tem: leitura, escrita e execução
- Grupo tem: leitura, escrita e execução
- Outros têm: leitura e execução

---

## Referências

- Comando: `man ls`
- Permissões: `man chmod`

