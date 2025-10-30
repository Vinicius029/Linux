# gpasswd

O comando gpasswd é usado para administrar grupos no Linux. Com ele, você pode:
* Definir uma senha para um grupo
* Adicionar ou remover usuários de um grupo
* Definir administradores de grupo
Ele faz alterações diretamente no arquivo `/etc/group`.

## Sintaxe básica
```bash
    gpasswd [opções] grupo
```

## Comandos

| Ação                       | Comando                         | Descrição                        |
| -------------------------- | ------------------------------- | -------------------------------- |
| Adicionar usuário ao grupo | `sudo gpasswd -a usuario grupo` | Inclui o usuário                 |
| Remover usuário do grupo   | `sudo gpasswd -d usuario grupo` | Remove o usuário                 |
| Definir administrador      | `sudo gpasswd -A usuario grupo` | Torna o usuário “admin” do grupo |
| Definir senha de grupo     | `sudo gpasswd grupo`            | Define uma senha (pouco usado)   |
| Ver membros do grupo       | `getent group grupo`            | Mostra todos os membros          |
