# Netstat

Oque ele faz?
- Conexões ativas
- Portas abertas
- Serviços escutando
- Estatísticas de rede
- Tabela de roteamento

## Comandos
```bash
    netstat

    # Conexões ativas, Portas escutando
    netstat -a

    # # Ver apenas portas em escuta
    netstat -l
    netstat -tuln

    # Mostrar qual processo está usando a porta
    netstat -tulnp

    # Ver conexões estabelecidas
    netstat -tn

    # Ver tabela de roteamento
    netstat -r
```

## Uso do dia a dia
```bash
    # Ver se um servidor está rodando
    netstat -tulnp | grep 80

    # Ver se SSH está ativo
    netstat -tulnp | grep 22

    # Ver conexões suspeitas
    netstat -tn
```

| Comando          | Função                |
| ---------------- | --------------------- |
| `netstat -tuln`  | Ver portas abertas    |
| `netstat -tulnp` | Ver portas + processo |
| `netstat -tn`    | Conexões TCP          |
| `netstat -s`     | Estatísticas          |
| `netstat -r`     | Rotas                 |


# Alternativa moderna: SS
Mais rapido que netstat
```bash
    ss -tulnp
```