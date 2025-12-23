# locate - Busca rapido de arquivos

Procura arquivos muito rápido, usando um banco de dados (não procura em tempo real no disco).<br>
Ele não varre o sistema na hora, apenas consulta um índice.

## Comando
```bash
    # Encontrar arquivo
    locate passwd

    locate os-release

    # Ignorar maiúsculas/minúsculas
    locate -i nginx

    # Limitar resultados
    locate -n 10 conf
```

## Importante: banco de dados

Se o arquivo foi criado recentemente, o locate pode não encontrá-lo.<br>
Nesse caso, atualize o banco:
```bash
    sudo updatedb
```

## updatedb — Atualiza o banco do locate

updatedb — Atualiza o banco do locate
```bash 
    sudo updatedb
```
