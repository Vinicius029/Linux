# which — Localiza o binário executado

Mostra qual binário será executado quando você digita um comando.<br>
Ele procura no PATH do usuário.

## Comandos
```bash 
    which ls

    # Saida
    /usr/bin/ls
```
## Limitação
- Só encontra comandos executáveis
- Não mostra arquivos comuns

## Muito útil para:
- Ver qual versão de um comando está sendo usada
- Debug de ambiente
- Conflitos entre versões (python, java, etc.)

