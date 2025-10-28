# Gerenciamento de usuários

O arquivo /etc/passwd contém informações sobre todos os usuários do sistema.

Cada linha representa um usuário, com vários campos separados por dois-pontos (:).

🔹 Ele é público (qualquer usuário pode ler),
mas não contém a senha real — apenas uma referência.

## `/etc/passwd`
* Lista dos usuários do sistema
* Antigamente -> arquivo de senhas (uso original)
* Legível por qualquer um no sistema 
* Pode ser editado com editores de textos; porém e recomendado que sejam feitas as alterações com o comando `usermod` (/usr/sbin/usermod)

## Explicando passwd
```
vinicius:x:1000:1000:Vinicius,,,:/home/vinicius:/bin/bash
   1     2   3    4      5             6            7
```
| Números                                 | Função |
| ---------------------------------------- | -------- |
| 1 | ome do usuário (1-32 caracteres) 
| 2 | Senha (senha shadow)
| 3 | UID (ID do usuário) (0-65535)
| 4 | GID (ID do grupo) (primário)
| 5 | Comentários - informações extras sobre o usuário
| 6 | SDiretório home (padrão)
| 7 | Shell padrão

## Identificando tipos de usuários
| Tipo    | UID   | Descrição                     |
| ------- | ----- | ----------------------------- |
| root    | 0     | Superusuário                  |
| Sistema | 1–999 | Usuários criados pelo sistema |
| Normal  | 1000+ | Usuários criados manualmente  |

## Comandos úteis
| Comando                                | Função                                  |
| -------------------------------------- | --------------------------------------- |
| `cat /etc/passwd`                      | Mostra todos os usuários                |
| `grep vinicius /etc/passwd`            | Mostra dados de um usuário específico   |
| `cut -d: -f1 /etc/passwd`              | Lista **somente os nomes** dos usuários |
| `less /etc/passwd`                     | Visualiza o arquivo de forma paginada   |
| `awk -F: '{print $1, $6}' /etc/passwd` | Mostra usuário e diretório home         |
