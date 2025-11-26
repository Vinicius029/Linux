# xargs
O `xargs` pega a entrada padrão e monta comando com isso.<br/>
Ele é tipo: "Pegue essa lista e passe como argumento para outro comando"<br/>

## Sintaxe

```bash
    echo "arquivo1 arquivo2 arquivo3" | xargs rm

    # Isso vira:
    rm arquivo1  arquivo2 arquivo3
```

## Exemplos 
```bash
    find . -name "*.log" | xargs rm
```
- find irá buscar todos os arquivos apartir do diretorio atual onde contem .log
- xargs ira apagar todos esses arquivos .log

```bash
    find . -name "*.log" -print0 | xargs -0 rm
```
- Irá apagar todos os arquivos .log, inclusive arquivos com espaço em branco: "Teste linux.log"
- -print0: separa por \0 (null), não por quebra de linha
- xargs -0: entende esse formato

### Roda um comando para cada item

```bash
    ll | awk '{print $9}' | xargs -n 1 echo "Arquivo:"
    
    # saida
    Arquivo:  lista.txt
    Arquivo:  tee.md
    Arquivo:  teste1.txt
    Arquivo:  teste.txt
    Arquivo:  xargs.md
```
- -n 1: usa 1 argumento por vez

## Comando úteis
* -n N → usa N argumentos por comando
* Ex.: -n 1 → 1 arquivo por vez
* -0 → trabalha com entradas separadas por \0 (combina com find ... -print0)
* -p → pergunta antes de executar cada comando (y/n)
* -I {} → permite usar um placeholder dentro do comando