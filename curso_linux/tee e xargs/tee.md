# tee

O tee lê da entrada padrão (stdin) e escreve:
* na saída padrão (stdout) e
* em um ou mais arquivos ao mesmo tempo.
* Pensa assim: ele é um T em um cano: duplica o fluxo — uma parte continua na tela, outra vai pro arquivo.

## Sintaxe
```bash
    ls -l | tee lista.txt
```
* Salva a saida no arquivo lista.txt e mostra no terminal

## Sobrescrever vs acrescentar 
Por padrão o `tee` sobrescreve o arquivo.

Sobrescrever por padrão
```bash
    ll | tee lista.txt
```
- Se o arquivo lista.txt existir, será substituido

### Acrescentar com `-a`
```bash
    ll | tee -a lista.txt
```
- Agora será acrescentado no final do arquivo

### Escrever em multiplos arquivos
```bash
    ls -l | tee arq1.txt arq2.txt arq3.txt
```
- A mesma saida irá para todos esses arquivos

