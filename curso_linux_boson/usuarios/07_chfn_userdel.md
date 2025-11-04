# chfn
O comando chfn (change finger information) serve para alterar as informações pessoais de um usuário, como nome completo, telefone e escritório.
Essas informações são armazenadas no arquivo /etc/passwd, nos campos adicionais após o shell.

## Sintaxe
```bash
    sudo chfn vinicius
```
O sistema abrirá uma tela interativa pedindo:
```bash
    Full Name: Vinicius Miguel
    Room Number: 201
    Work Phone: 555-1234
    Home Phone: 555-5678
```

### Atualizar informações diretamente (sem modo interativo)
```bash
    sudo chfn -f "Vinicius Miguel" vinicius
```
| Opção | Significado                       |
| ----- | --------------------------------- |
| `-f`  | Nome completo (Full Name)         |
| `-r`  | Número da sala (Room number)      |
| `-w`  | Telefone do trabalho (Work Phone) |
| `-h`  | Telefone residencial (Home Phone) |

## userdel — User Delete
O comando userdel é usado para remover uma conta de usuário do sistema.
Ele apaga as entradas do /etc/passwd, /etc/shadow, /etc/group, e opcionalmente, o diretório home e o mailbox.

### Sintaxe
* paga o usuário e todo o conteúdo do /home/joao
```bash
    sudo userdel -r joao
```

Outras opções:
| Opção                | Descrição                                                             |
| -------------------- | --------------------------------------------------------------------- |
| `-r`                 | Remove o diretório home e o mailbox                                   |
| `-f`                 | Força a exclusão, mesmo se o usuário estiver logado                   |
| `--remove-all-files` | Remove todos os arquivos do usuário em todo o sistema (não só o home) |




