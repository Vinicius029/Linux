# history

Comando que mostrar todos os históricos dos comandos executados

## Na platica
```bash
    # Lista os comandosm anteriores
    history

    # Executar um comando através do número do history
    # Se aparecer isso:
    105  ls -lha
    106  sudo apt update
    # Pode rodar diretamente como:
    !105

    # Repete último comando
    !!

    # Repede último comando que começa com certa palavra:
    !ls

    # Apaga o histórico di id 106:
    history -d 106

    # CTRL+R habilita para pesquisar comando no histórico

    # Limpar da tela:
    history -c
    # Limpa também o arquivo salvo (~/.bash_history)
    cat /dev/null > ~/.bash_history

```

