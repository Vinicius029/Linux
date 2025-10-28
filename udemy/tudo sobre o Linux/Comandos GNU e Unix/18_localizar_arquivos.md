# Localizar arquivos no linux

## Estrutura de diretórios do Linux
O Linux organiza tudo em uma árvore hierárquica que começa em / (raiz).
 
| Diretório        | Função principal                                  |
| ---------------- | ------------------------------------------------- |
| `/`              | Raiz do sistema. Tudo começa aqui.                |
| `/bin`           | Programas essenciais (ex: `ls`, `cp`, `mv`)       |
| `/boot`          | Arquivos de inicialização (kernel, GRUB, etc.)    |
| `/dev`           | Dispositivos do sistema (discos, USB, etc.)       |
| `/etc`           | Arquivos de configuração do sistema               |
| `/home`          | Diretórios dos usuários comuns (`/home/vinicius`) |
| `/lib`, `/lib64` | Bibliotecas essenciais do sistema                 |
| `/media`         | Montagem automática de mídias (pendrives, discos) |
| `/mnt`           | Montagem manual de discos e partições             |
| `/opt`           | Programas opcionais (softwares extras)            |
| `/root`          | Diretório pessoal do superusuário (root)          |
| `/sbin`          | Programas administrativos do sistema              |
| `/tmp`           | Arquivos temporários                              |
| `/usr`           | Programas e arquivos de usuários                  |
| `/var`           | Dados variáveis (logs, e-mails, cache, etc.)      |

## Comando `find`

Buscar por nome:
```bash
   find /home -name "arquivo.txt"
```
Buscar por tipo:
```bash
   find /etc -type d -name "nginx"
```
* -type f → arquivo
* -type d → diretório
Buscar por extensão:
```bash
   find /var/log -name "*.log"
```
Buscar por data (últimos 2 dias):
```bash
   find /home -mtime -2
```
Buscar por tamanho:
```bash
   find / -size +100M
```
* (arquivos maiores que 100 MB)

## which, whereis, whatis

* `which git`: Mostra o caminho completo de um comando executável
* `whereis git`: Mostra onde estão os binários, fontes e manuais de um programa
* `whatis git`: Mostra uma descrição curta do comando

## Combinações úteis
| Objetivo                                            | Comando                                  |
| --------------------------------------------------- | ---------------------------------------- |
| Procurar arquivo por nome e exibir caminho completo | `find / -name "arquivo.txt" 2>/dev/null` |
| Procurar arquivos grandes                           | `find / -type f -size +500M 2>/dev/null` |
| Ver onde um programa está instalado                 | `which nginx`                            |
| Procurar todos os logs no sistema                   | `find /var/log -name "*.log"`            |
| Procurar texto dentro de arquivos de configuração   | `grep -r "timeout" /etc`                 |

## grep
procurar texto dentro de arquivos
```bash
   grep "palavra" arquivo.txt
   grep -r "config" /etc
```
* -r → pesquisa recursiva em pastas
* -i → ignora maiúsculas/minúsculas
* -n → mostra número da linha