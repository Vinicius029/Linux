# Touch

Permite alterar o registro de data e hora de modificação e acesso de um arquivo

* -a Altera a hora de Acesso
* -m Altera a hora de Modificação
* -t YYMMDDhhmmss - Configura a hora digitada

## Comando:

* Alterar dados do arquivo:
```bash
    touch -m  -t 201309291730 teste
```
Saida: -rw-r--r-- 1 vinicius vinicius 0 Sep 29  2013 teste

# Cut

"Cortar" campos ou colunas selecionados de cada linha de um arquivo; Imprime colunas ou campos delimitados por espaços ou outros caracteres especificados pelo usuário.

* -C Posição de caractere
* -f[n] Campos
* -d[d] Delimitador

## Comando:

* Imprime as colunas de 1 a 6:
```bash
    cut -c1-6 arq1 
```

* Imprime as colunas aparti do 4:
```bash
    cut -c4- arq1 
```
* Imprime somente o campo de usuario:
```bash
    cut -d: -f1 /etc/passwd  
```
* Imprime somente o campo de usuario, e diretório padrão:
```bash
    cut -d: -f1,6 /etc/passwd 
```




