# Gerenciamento de usuários

O arquivo /etc/shadow armazena as senhas criptografadas e informações de expiração das contas de usuário do sistema.
Ele é altamente protegido — somente o usuário root pode lê-lo, ou permissão sudo,
justamente para manter as senhas seguras.

## Estrutura de uma linha
Cada linha representa um usuário, com os campos separados por dois-pontos (:).
```bash
    vinicius:$y$j9eYB8eZsjqR8S1..dGP2x0:19930:0:99999:7:::
```
| Campo | Exemplo                                       | Descrição                                          |
| ----- | --------------------------------------------- | -------------------------------------------------- |
| 1️⃣   | `vinicius`                                    | Nome do usuário                                    |
| 2️⃣   | `$y$j9eYB8eZsjqR8S1..dGP2x0` | Senha criptografada                                |
| 3️⃣   | `19930`                                       | Última alteração de senha (em dias desde 1/1/1970) |
| 4️⃣   | `0`                                           | Dias mínimos antes de permitir trocar a senha      |
| 5️⃣   | `99999`                                       | Dias máximos antes da senha expirar                |
| 6️⃣   | `7`                                           | Dias de aviso antes da expiração                   |
| 7️⃣   | ` ` (vazio)                                   | Dias após expiração antes de desativar conta       |
| 8️⃣   | ` ` (vazio)                                   | Data em que a conta será desativada                |
| 9️⃣   | ` ` (vazio)                                   | Reservado para uso futuro                          |

## Campo da senha (2º campo)
O campo da senha pode ter diferentes significados:
| Valor            | Significado                                    |
| ---------------- | ---------------------------------------------- |
| `$6$` ou `$y$`   | Tipo de criptografia (SHA-512, yescrypt, etc.) |
| `!` (exclamação) | Conta bloqueada (login desativado)             |
| `*` (asterisco)  | Conta sem senha (ou apenas de sistema)         |
| vazio            | Sem senha definida (⚠️ inseguro)               |

## Relação com /etc/passwd
* O /etc/passwd tem a referência à senha (campo x)
* O /etc/shadow guarda a senha real criptografada

## Comandos úteis
| Comando                             | Função                                      |
| ----------------------------------- | ------------------------------------------- |
| `sudo chage -l vinicius`            | Mostra as informações de expiração da conta |
| `sudo chage -M 90 vinicius`         | Define validade máxima da senha em 90 dias  |
| `sudo chage -E 2025-12-31 vinicius` | Define data de expiração da conta           |
| `sudo passwd -l vinicius`           | Bloqueia a conta (coloca “!” na senha)      |
| `sudo passwd -u vinicius`           | Desbloqueia a conta                         |
| `date -d "1970/01/01 + 20372 days"` | Mostra ultima atualização da senha          |