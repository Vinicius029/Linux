# usermod

O usermod (user modify) é usado para alterar atributos de uma conta de usuário já existente no sistema.
Ele modifica informações armazenadas principalmente nos arquivos:
* /etc/passwd
* /etc/shadow
* /etc/group
* /etc/gshadow

## Sintaxe
```bash
    usermod [opções] nome_do_usuário
```
## Comandos
* `sudo usermod -aG sudo joao`: Adicionar um usuário a um grupo existente
* `sudo usermod -d /home/vinicius vinicius`: Define um novo diretório home para vinicius
* `sudo usermod -L vinicius`: Bloquear (impede login)
* `sudo usermod -U vinicius`: Desbloquear
* `sudo usermod -s /bin/bash vinicius`: Troca o shell padrão
* `sudo usermod -l vinicius_dev vinicius`: Renomeia o usuário vinicius para vinicius_dev
* `sudo usermod -u 1050 vinicius`: Altera o UID → identificador do usuário
* `sudo usermod -g grupo vinicius`: Altera o GID → grupo padrão do usuário

## Resumo 
| Ação                 | Comando                            | Descrição                          |
| -------------------- | ---------------------------------- | ---------------------------------- |
| Adicionar a grupo(s) | `usermod -aG grupo usuario`        | Inclui em grupo sem remover outros |
| Mudar diretório home | `usermod -d /novo/home -m usuario` | Altera e move o home               |
| Bloquear usuário     | `usermod -L usuario`               | Impede login                       |
| Desbloquear usuário  | `usermod -U usuario`               | Permite login novamente            |
| Trocar shell padrão  | `usermod -s /bin/bash usuario`     | Define novo shell                  |
| Alterar nome         | `usermod -l novo usuario`          | Renomeia conta                     |
| Alterar UID/GID      | `usermod -u/-g valor usuario`      | Muda identificadores               |

