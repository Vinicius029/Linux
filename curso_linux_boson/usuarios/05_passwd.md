# passwd

O comando passwd serve para criar, alterar ou gerenciar senhas de usuários no Linux.
Ele atualiza as informações no arquivo /etc/shadow, onde as senhas são armazenadas de forma criptografada.

## Sintaxe básica

```bash
    passwd [opções] [usuário]
```
Se você executar sem opções nem nome de usuário, o Linux entende que você quer alterar a senha do usuário atual.
```bash
    passwd
```
O sistema pedirá a senha atual e a nova senha.

## Usos mais comuns

* `sudo passwd vinicius`: Alterar a senha de outro usuário (como root)
* `sudo passwd vinicius`: Bloquear uma conta. 
* `sudo passwd -u vinicius`: Desbloquear uma conta
* `sudo passwd -x 90 vinicius`: Define que a senha expira a cada 90 dias.
* `sudo passwd -e vinicius`: Faz com que o usuário seja obrigado a definir uma nova senha no próximo acesso.
* `sudo passwd vinicius`: 

| Opção     | Função                                                        |
| --------- | ------------------------------------------------------------- |
| `-l`      | Bloqueia a senha (login desativado)                           |
| `-u`      | Desbloqueia a senha                                           |
| `-d`      | Remove a senha (login sem senha) ⚠️ inseguro                  |
| `-e`      | Expira a senha (força troca no próximo login)                 |
| `-x dias` | Define validade máxima da senha                               |
| `-n dias` | Define tempo mínimo antes de poder trocar                     |
| `-w dias` | Define quantos dias antes da expiração o usuário será avisado |

Exemplo prático completo
```bash
    sudo passwd -x 90 -w 7 -n 1 vinicius
```
* A senha expira em 90 dias
* O sistema avisa 7 dias antes
* O usuário precisa esperar 1 dia antes de trocar novamente

## Verificando informações de senha
```bash
    sudo chage -l vinicius
```

## Arquivos envolvidos
| Arquivo       | Função                                                       |
| ------------- | ------------------------------------------------------------ |
| `/etc/passwd` | Guarda o nome do usuário e o campo “x” (referência da senha) |
| `/etc/shadow` | Guarda a senha criptografada e informações de expiração      |

## Boas práticas
* Sempre use sudo ao alterar senhas de outros usuários.
* Combine passwd com chage para políticas de segurança.
* Nunca edite /etc/shadow diretamente — use passwd para garantir segurança.