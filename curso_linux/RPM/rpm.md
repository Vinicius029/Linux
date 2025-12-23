# Gerenciamento de pacotes RPM no Linux

RPM = Red Hat Package Manager<br/>
É o formato de pacote (.rpm) e também o comando usado para:
* Instalar
* Atualizar
* Remover
* Consultar informações de pacotes

Normalmente, você usa um gerenciador de alto nível (tipo yum ou dnf) no dia a dia, e o rpm fica como ferramenta mais “baixa nível”.

## Instalar um pacote .rpm
```bash
    sudo rpm -ivh meuapp-1.0-1.x86_64.rpm
```
* -i → install (instalar)
* -v → verbose (detalhado)
* -h → hash (mostra “####” de progresso)

Se faltarem dependências, o rpm vai reclamar, mas não resolve sozinho.<br/>
Por isso, normalmente usamos yum install arquivo.rpm ou dnf install arquivo.rpm, que resolvem dependências.

## Comandos
| Ação                     | Comando                    |
| ------------------------ | -------------------------- |
| Instalar pacote          | `rpm -ivh pacote.rpm`      |
| Atualizar/instalar       | `rpm -Uvh pacote.rpm`      |
| Remover pacote           | `rpm -e nome_do_pacote`    |
| Listar todos             | `rpm -qa`                  |
| Procurar por nome        | `rpm -qa \| grep nome`     |
| Info de pacote instalado | `rpm -qi nome`             |
| Arquivos de um pacote    | `rpm -ql nome`             |
| Ver dono de um arquivo   | `rpm -qf /caminho/arquivo` |
| Info de arquivo .rpm     | `rpm -qpi arquivo.rpm`     |
| Arquivos de um .rpm      | `rpm -qpl arquivo.rpm`     |
| Verificar pacote         | `rpm -V nome`              |
