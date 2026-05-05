# Redes para DevOps — Aula 01: Conceitos Básicos

## O que você aprendeu

Os 4 pilares de qualquer configuração de rede:

| Conceito | O que é | Seu valor |
|---|---|---|
| **IP** | Endereço da sua máquina na rede | `192.168.1.7` |
| **Máscara (/24)** | Define o tamanho da rede | `255.255.255.0` |
| **Gateway** | Porta de saída para a internet | `192.168.1.1` |
| **DNS** | Traduz nomes em IPs | `127.0.0.53` (local) |

---

## Comandos praticados

```bash
# Ver interfaces de rede e IPs
ip a

# Ver tabela de rotas
ip route show

# Ver DNS configurado
cat /etc/resolv.conf

# Ver DNS externo real (Ubuntu/Debian)
resolvectl status

# Testar conexão
ping -c 4 8.8.8.8

# Consultar DNS manualmente
nslookup google.com
dig google.com
```

---

## Interfaces encontradas (`ip a`)

| Interface | Tipo | Status | IP |
|---|---|---|---|
| `lo` | Loopback | UP | `127.0.0.1` |
| `enp1s0` | Cabo (ethernet) | DOWN | — |
| `wlp2s0` | Wi-Fi | **UP** | `192.168.1.7/24` |
| `docker0` | Docker virtual | DOWN | `172.17.0.1/16` |
| `br-xxx` | Docker bridge | DOWN | `172.18/19.0.1/16` |

---

## Rotas encontradas (`ip route show`)

```
default via 192.168.1.1 dev wlp2s0   → qualquer destino vai pro roteador
192.168.1.0/24 dev wlp2s0            → rede local, fala direto sem gateway
172.17/18/19.0.0/16 dev docker0      → redes internas do Docker
169.254.0.0/16 dev wlp2s0            → link-local, só aparece sem DHCP
```

---

## Como funciona o DNS

```
browser → 127.0.0.53 (systemd-resolved) → roteador → 8.8.8.8 (Google DNS)
```

- `127.0.0.53` não é o DNS real — é um cache local do Linux (systemd-resolved)
- Ele guarda respostas recentes para não consultar o servidor externo toda vez
- DNS = lista telefônica da internet: traduz `google.com` → `142.250.79.46`

---

## Caminho de um pacote até a internet

```
Sua máquina (192.168.1.7)
    → Wi-Fi (wlp2s0)
    → Roteador (192.168.1.1)
    → NAT (troca IP privado pelo IP público da operadora)
    → Internet
    → Destino (ex: google.com)
```

> **NAT:** o roteador substitui seu IP privado pelo IP público antes de enviar pra internet.
> Por isso ninguém de fora consegue acessar `192.168.1.7` diretamente.

---

## Conceitos-chave

- **IP privado** — só visível dentro da sua rede local (ex: `192.168.1.x`)
- **IP público** — visível na internet, dado pela operadora ao roteador
- **DHCP** — protocolo que distribui IPs automaticamente (seu IP veio assim: `proto dhcp`)
- **metric** — prioridade de rota; menor valor = rota preferida
- **/24** — sua rede comporta 254 hosts (de `192.168.1.1` até `192.168.1.254`)

---

## Conexão com AWS VPC (próximos estudos)

| Conceito local | Equivalente na AWS |
|---|---|
| Sua rede `192.168.1.0/24` | Subnet privada |
| Roteador / gateway | Internet Gateway (IGW) |
| IP privado `192.168.1.7` | IP privado da instância EC2 |
| NAT do roteador | NAT Gateway |
| DNS `8.8.8.8` | Route 53 / DNS da VPC |

---

## Próxima aula

**Aula 02 — Portas e Protocolos**
- O que são portas (22, 80, 443...)
- Diferença entre TCP e UDP
- Como o firewall usa portas para liberar ou bloquear tráfego