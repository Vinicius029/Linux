# alias

O alias no Linux serve para criar atalhos de comandos, facilitando sua vida no terminal.
Exemplo: transformar o comando `ls -lha` em algo curto como `ll`.

## Comandos
```bash
    # Exibir alias existente
    alias

    # Criar uma alias temporário
    alias c='clear'
    # Agora pode executar no bash
    c

    # Git
    alias gs='git status'
    alias gp='git pull'
    alias gco='git checkout'

    # Gestão de pacotes
    alias update='sudo apt update && sudo apt upgrade -y'
```
### Criar alias permanente<br/>
Edite o arquivo ~/.bashrc, ~/.bash_aliases, ou ~/.zshrc (dependendo de qual shell usa):
```bash
    nano ~/.bashrc

    # Adicione na linha 'some more ls aliases'
    alias gs='git status'
    alias gp='git push'
    
    # Salve e recarregue
    source ~/.bashrc
```

### Remover um alias temporário
```bash
    unalias ll

    # Remove todos
    unalias -a
```