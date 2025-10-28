# Gerenciamento de usuários

O arquivo `/etc/group` armazena informações sobre os grupos existentes no sistema.
Cada linha representa um grupo e define quais usuários fazem parte dele.

Ele é usado para gerenciar permissões coletivas, como acesso a pastas, dispositivos e comandos.

## Estrutura de uma linha
Exemplo de linha no /etc/group:
```bash
    vinicius:x:1000:
```
Cada campo é separado por dois-pontos (:) e tem o seguinte significado:

| Campo              | Exemplo             | Descrição                                              |
| ------------------ | ------------------- | ------------------------------------------------------ |
| 1️⃣ Nome do grupo  | `vinicius`          | Nome do grupo                                          |
| 2️⃣ Senha          | `x`                 | Indica que a senha (se existir) está em `/etc/gshadow` |
| 3️⃣ GID (Group ID) | `1000`              | Identificador numérico do grupo                        |
| 4️⃣ Membros        | `usuario1,usuario2` | Lista de usuários adicionais pertencentes ao grupo     |

## Relação entre `/etc/passwd` e `/etc/group`

* Cada usuário tem um grupo principal, definido pelo GID no /etc/passwd.
* Ele também pode participar de outros grupos secundários, listados no /etc/group.
```bash
    /etc/passwd:
    vinicius:x:1000:1000:Vinicius:/home/vinicius:/bin/bash

    /etc/group:
    vinicius:x:1000:
    sudo:x:27:vinicius
```
O grupo principal de vinicius é vinicius (GID 1000)
Ele também faz parte do grupo sudo

## Comandos úteis

| Comando                                     | Função                                    |
| ------------------------------------------- | ----------------------------------------- |
| `cat /etc/group`                            | Mostra todos os grupos                    |
| `grep vinicius /etc/group`                  | Mostra os grupos onde o usuário participa |
| `groups vinicius`                           | Lista os grupos do usuário                |
| `getent group sudo`                         | Mostra detalhes de um grupo específico    |
| `sudo groupadd desenvolvedores`             | Cria um novo grupo                        |
| `sudo usermod -aG desenvolvedores vinicius` | Adiciona um usuário a um grupo            |
| `sudo gpasswd -d vinicius desenvolvedores`  | Remove um usuário de um grupo             |

## Arquivo `/etc/gshadow`
Assim como as senhas dos usuários ficam em /etc/shadow,
as senhas dos grupos (caso existam) ficam em /etc/gshadow,
que é acessível somente pelo root.
