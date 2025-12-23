# whereis — Localiza binários, fontes e manuais

Localiza:
- binário (/bin, /usr/bin)
- arquivos de configuração
- páginas de manual (man)

## Comandos
```bash
    whereis ls
    # Saida
    ls: /usr/bin/ls /usr/share/man/man1/ls.1.gz

    # Apenas binários
    whereis -b ls

    # Apenas manual
    whereis -m ls
```