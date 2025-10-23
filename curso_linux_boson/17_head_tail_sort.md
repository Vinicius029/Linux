# Head

Mostra as primeiras linhas de um ou mais arquivos.

## Comando:

* Mostra as primeiras 15 linhas do arquivos, utilizando `-n15`
```bash
    head -n15 /etc/passwd
```
* Mostra as primeiras 20 caracteres, utilizando `-c20`
```bash
    head -c20 /etc/passwd
```
* Mostra as primeiras 5 linhas do arquivos, utilizando `-n5`, e utlizando `cut` para filtrar somente o primeiro campo
```bash
    head -n5 etc/passwd | cut -d: -f1
```

# Tail

Usado para ver as últimas linhas de um arquivo.

## Comando:

* Mostra as últimas 15 linhas do arquivos, utilizando `-n15`
```bash
    head -n15 /etc/passwd
```
* Mostra as últimas 20 caracteres, utilizando `-c20`
```bash
    head -c20 /etc/passwd
```
* Mostra as últimas 5 linhas do arquivos, utilizando `-n5`, e utlizando `cut` para filtrar somente o primeiro campo
```bash
    head -n5 /etc/passwd | cut -d: -f1
```

# Sort

Organiza os dados de acordo com a necessidade dos usuários (de acordo com a primeira coluna de caracteres).

* -f Ignora o caso
* -n Numericamente
* -r Ordem reversa

## Comandos:

* Organiza a primeira coluna
```bash
    sort arq1
```
* Organiza a primeira coluna, numericamente
```bash
    sort -n arq1
```
* Organiza a primeira coluna, numericamente e reverso
```bash
    sort -n -r arq1
```

### arquivo arq1
1 laranja 2,00  
2 maça 3,50     
3 açai 7,00     
4 tangerina 4,00
5 laranja 2,00
6 maça 3,50
7 açai 7,00
8 tangerina 4,00
9 açai 7,00
10 tangerina 4,00
