# Split e Cat

Divide um arquivo em várias partes em uma sucessão de arquivos com final aa, ab, ac.

* --lines=n, -l=n    n linhas p/ arquivo
* --bytes=n, -b=n    n bytes por arquivos

## Comando:

- No diretório /home/user/split, irá dividir o arquivo passwd em 200 bytes, e os arquivos será nomeados com pass-
```bash
    split -b 200 passwd pass-
```
- Concatenara todos os arquivos que contém pass-, e criara um novo, com o mesmo quantidade de bytes do original, e conteudo
```bash
    cat pass-* > passwd-new
```


