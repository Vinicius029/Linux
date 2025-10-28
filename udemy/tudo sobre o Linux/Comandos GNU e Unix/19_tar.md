# tar

O comando tar é um dos mais importantes do Linux para compactar, agrupar e descompactar arquivos e diretórios.
Ele vem do nome “tape archive”, criado originalmente para gravar dados em fitas (tape drives) — mas hoje serve para criar backups e arquivos compactados (.tar, .tar.gz, .tar.bz2, etc.).

## Função principal

O tar agrupa múltiplos arquivos ou diretórios em um único arquivo (chamado de arquivo tarball).
Ele não comprime por padrão, apenas junta.
Mas pode ser combinado com compressão (gzip, bzip2, xz).

## Sintaxe básica
```bash
   tar [opções] [arquivo.tar] [arquivos/diretórios...]
```

## Exemplo de Uso

Criar um arquivo `.tar`
```bash
   tar -cf backup.tar home/user
```
| Opção | Significado                   |
| ----- | ----------------------------- |
| `-c`  | Criar novo arquivo (`create`) |
| `-f`  | Nome do arquivo (`file`)      |

Listar o conteúdo de um `.tar`
```bash
   tar -tf backup.tar
```
| Opção | Significado                  |
| ----- | ---------------------------- |
| `-t`  | Listar (`table of contents`) |
| `-f`  | Especifica o arquivo         |

Extrair (descompactar) um `.tar`
```bash
   tar -xf backup.tar
```
| Opção | Significado         |
| ----- | ------------------- |
| `-x`  | Extrair (`extract`) |
| `-f`  | Nome do arquivo     |

* Exemplo:
```bash
   tar -xf backup.tar -C /home/vinicius/restaurar
```
Extrai tudo para o diretório /home/vinicius/restaurar

## Criar e compactar (gzip ou bzip2)

O tar pode compactar junto ao criar o arquivo. Isso é feito com as opções `-z`, `-j` ou `-J`:
| Compressão | Extensão comum      | Opção | Exemplo                          |
| ---------- | ------------------- | ----- | -------------------------------- |
| **gzip**   | `.tar.gz` ou `.tgz` | `-z`  | `tar -czf backup.tar.gz pasta/`  |
| **bzip2**  | `.tar.bz2`          | `-j`  | `tar -cjf backup.tar.bz2 pasta/` |
| **xz**     | `.tar.xz`           | `-J`  | `tar -cJf backup.tar.xz pasta/`  |

exemplo:
```bash
   tar -czf site_backup.tar.gz /var/www/html
```
* Cria um backup compactado do site em gzip.

## Extrair arquivos compactados
| Tipo                | Comando                    |
| ------------------- | -------------------------- |
| `.tar.gz` ou `.tgz` | `tar -xzf arquivo.tar.gz`  |
| `.tar.bz2`          | `tar -xjf arquivo.tar.bz2` |
| `.tar.xz`           | `tar -xJf arquivo.tar.xz`  |

## Adicionar arquivos a um .tar existente
```bash
   tar -rf backup.tar novo_arquivo.txt
```
| Opção | Significado          |
| ----- | -------------------- |
| `-r`  | Adicionar (`append`) |
| `-f`  | Nome do arquivo      |

## Excluir arquivos dentro de um .tar
```bash
   tar -rf backup.tar novo_arquivo.txt
```

## Ignorar arquivos ao criar backup
```bash
   tar -czf backup.tar.gz /home/vinicius --exclude=/home/vinicius/Downloads
```
* Cria backup da pasta home, mas ignora “Downloads”.

## Backup completo com data automática
```bash
   tar -czf backup_$(date +%Y-%m-%d).tar.gz /etc /home/vinicius
```
## Combinações mais usadas
| Ação               | Comando                               | Descrição                  |
| ------------------ | ------------------------------------- | -------------------------- |
| Criar `.tar`       | `tar -cf arquivo.tar pasta/`          | Cria um arquivo tar        |
| Criar `.tar.gz`    | `tar -czf arquivo.tar.gz pasta/`      | Cria e compacta            |
| Criar `.tar.bz2`   | `tar -cjf arquivo.tar.bz2 pasta/`     | Cria e compacta em bzip2   |
| Extrair `.tar`     | `tar -xf arquivo.tar`                 | Extrai                     |
| Extrair `.tar.gz`  | `tar -xzf arquivo.tar.gz`             | Extrai gzip                |
| Listar conteúdo    | `tar -tf arquivo.tar`                 | Mostra o que tem dentro    |
| Ver com detalhes   | `tar -tvf arquivo.tar`                | Mostra lista detalhada     |
| Extrair para pasta | `tar -xzf arquivo.tar.gz -C /destino` | Extrai em local específico |
