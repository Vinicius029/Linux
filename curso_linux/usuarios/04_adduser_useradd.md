# Comandos useradd e adduser no Linux

Ambos os comandos servem para criar novos usuários no sistema Linux,
mas não são exatamente iguais.

| Comando   | Tipo                          | Descrição                                                                            |
| --------- | ----------------------------- | ------------------------------------------------------------------------------------ |
| `useradd` | Programa nativo (baixo nível) | Cria um usuário de forma **direta**, sem interação                                   |
| `adduser` | Script em Perl (alto nível)   | Usa o `useradd` por baixo dos panos, mas de forma **mais amigável** e **interativa** |

## Diferença prática

### `useradd`

* É baixo nível
* Não cria o diretório /home automaticamente (a menos que use -m)
* Não pergunta nada — tudo precisa ser passado via opções
```bash
    sudo useradd -m -s /bin/bash -c "Vinicius Miguel" vinicius
    sudo passwd vinicius
```
* -m → cria o diretório /home/vinicius
* -s /bin/bash → define o shell padrão
* -c → adiciona um comentário (geralmente o nome completo)
* Depois, o passwd define a senha

### `adduser`

* É alto nível
* Cria automaticamente o diretório home
* Pergunta o nome completo, senha, telefone e outros dados
* É mais usado em distribuições Debian/Ubuntu
```bash
    sudo adduser vinicius
```
Saída típica:
```bash
    Adding user `vinicius` ...
    Adding new group `vinicius` (1001) ...
    Adding new user `vinicius` (1001) with group `vinicius` ...
    Creating home directory `/home/vinicius` ...
    Copying files from `/etc/skel` ...
    Enter new UNIX password:
    Retype new UNIX password:
    Full Name [ ]: Vinicius Miguel
    Room Number [ ]:
    Work Phone [ ]:
    Home Phone [ ]:
    Other [ ]:
    Is the information correct? [Y/n]
```

## Principais opções do useradd
| Opção                | Descrição                                                     |
| -------------------- | ------------------------------------------------------------- |
| `-m`                 | Cria diretório `/home`                                        |
| `-d /caminho`        | Define diretório home personalizado                           |
| `-s /bin/bash`       | Define o shell                                                |
| `-c "Nome Completo"` | Comentário (campo GECOS)                                      |
| `-u 1050`            | Define UID manualmente                                        |
| `-g grupo`           | Define grupo principal                                        |
| `-G grupo1,grupo2`   | Define grupos secundários                                     |
| `-e 2025-12-31`      | Define data de expiração da conta                             |
| `-p senha`           | Define senha (geralmente não usado diretamente por segurança) |


Exemplo de criação completa com `useradd`
```bash
    sudo useradd -m -d /home/vinicius -s /bin/bash -c "Vinicius Miguel" -G sudo,adm vinicius
    sudo passwd vinicius
```

## Verificando o usuário criado
| Comando           | Função                                  |                                   |
| ----------------- | --------------------------------------- | --------------------------------- |
| `cat /etc/passwd  | grep vinicius`                          | Mostra a entrada no `/etc/passwd` |
| `id vinicius`     | Mostra UID, GID e grupos                |                                   |
| `groups vinicius` | Lista os grupos do usuário              |                                   |
| `ls /home`        | Verifica se o diretório home foi criado |                                   |

## Resumo
| Comando   | Tipo        | Cria `/home`? | Interativo? | Ideal para          |
| --------- | ----------- | ------------- | ----------- | ------------------- |
| `useradd` | Baixo nível | ❌ (usa `-m`)  | ❌           | Scripts e automação |
| `adduser` | Alto nível  | ✅             | ✅           | Uso manual e fácil  |

