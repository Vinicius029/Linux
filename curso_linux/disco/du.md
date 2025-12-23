# du - Disk Usage

Mostra o uso de espaço em disco de arquivos e diretórios específicos
- Quanto cada pasta ou arquivo ocupa

Ele trabalha dentro do sistema de arquivos (nível de diretórios).

## Comando
```bash
    # Formato legível
    du -h /home

    # Verificar tamanho total de um diretório
    du -sh /home

    # Ver tamanho de subdiretórios
    du -h --max-depth=1 /home/user | sort -hr
```

## Quando usar du

- Descobrir qual pasta está enchendo o disco
- Auditoria de espaço
- Limpeza de sistema
- Análise de diretórios grandes

