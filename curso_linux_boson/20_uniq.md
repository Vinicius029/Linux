# wc

* Escreve em stdout uma entrada, eliminando linhas duplicadas adjacentes
* Para eliminar linhas duplicadas não-adjacentes, primeiro organize o arquivo com sort

* -d Processa apenas as linhas que se repetem
* -u Processa apenas as linhas que não se repetem

## Comando:

- Elimina as linhas duplicadas
```bash
    uniq -d arq1
```
- Elimina as que não se repetem
```bash
    wc -u arq1
```
====== Arquivo =======
1 laranja 2,00
2 maça 3,50
3 açai 7,00
3 açai 7,00
4 tangerina 4,00
5 laranja 2,00
6 maça 3,50
7 açai 7,00
8 tangerina 4,00
9 açai 7,00
10 tangerina 4,00


