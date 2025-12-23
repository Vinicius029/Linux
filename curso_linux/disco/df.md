# df - Disk Free

Mostra o uso de espaço em disco dos sistemas de arquivos montados
- Quanto espaço existe
- Quanto está usado
- Quanto ainda está livre

Ele trabalha no nível do sistema de arquivos (partições, volumes).

## Comando
```bash
    # Mostra em formato legível (MB,GB)
    df -h

    # Mostra apenas tipos de sistema de arquivo
    df -T

    # Ver espaço de um ponto específico
    df -h /home/user
```

## Quando usar df

- Ver se o disco está cheio
- Monitorar partições
- Checar espaço disponível antes de backups
- Diagnóstico de erro: “No space left on device”