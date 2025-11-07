# ping
Testa a conectividade entre o seu computador e outro host (servidor, site, IP, etc.).

É o comando mais básico e útil para verificar se a rede está funcionando.
```bash
    ping -c 5 google.com
```
* Envia pacotes ICMP (“eco”) para o destino.
* Mede o tempo de resposta (latência).
* Mostra se há perda de pacotes.

# dig (Domain Information Groper)
Consulta servidores DNS para obter informações detalhadas sobre domínios.
É como perguntar diretamente ao DNS:
* “Qual o IP de google.com?”
```bash
    dig google.com
```
dig é essencial para diagnosticar problemas de DNS (resolução de nomes).

## whois
Mostra informações de registro de um domínio ou IP, como:
* Nome do dono
* País e organização
* Servidores DNS
* Datas de criação e expiração
```bash 
    whois google.com
```

## Resumo
| Comando | Função principal                       | Exemplo                 |
| ------- | -------------------------------------- | ----------------------- |
| `ping`  | Testar conexão com outro host          | `ping google.com`       |
| `dig`   | Consultar DNS (ver IP, MX, NS, etc.)   | `dig google.com +short` |
| `whois` | Ver informações de registro do domínio | `whois google.com`      |

