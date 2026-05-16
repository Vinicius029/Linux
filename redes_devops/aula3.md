# Redes para DevOps — Aula 03: Sub-redes e CIDR

Um endereço IP tem 32 bits no total. O CIDR (a notação com /) diz quantos bits pertencem à rede e quantos sobram para identificar dispositivos dentro dela.

---

## A fórmula para nunca mais esquece

```
Hosts disponíveis = 2^(32 - prefixo) - 2
```

| CIDR | Bits de host | Cálculo | Hosts disponíveis | Uso típico |
|---|---|---|---|---|
| /8 | 24 bits | 2²⁴ - 2 | 16.777.214 | ISPs, grandes provedores |
| /16 | 16 bits | 2¹⁶ - 2 | 65.534 | VPC inteira na AWS |
| /24 | 8 bits | 2⁸ - 2 | 254 | redes domésticas, subnets médias |
| /28 | 4 bits | 2⁴ - 2 | 14 | subnets pequenas na AWS |

> O `-2` é porque o primeiro endereço identifica a **rede** e o último é o **broadcast** — ambos reservados, não usáveis por dispositivos.

---

## Como ler um endereço IP com CIDR

```
192.168.1.7/24
│           │
│           └── /24 = 24 bits são da rede, 8 bits são do host
└────────────── endereço completo do dispositivo
```

```
192.168.1   .   7
──────────      ─
rede /24        host
(igual p/ todos  (número único
 da rede)         na rede)
```

Analogia: `192.168.1` é o nome da rua — `.7` é o número da sua casa.

---

## Comando praticado

```bash
# Calcula todos os detalhes de uma subnet
ipcalc 192.168.1.7/24

# Instalar se não tiver
sudo apt install ipcalc -y
```

---

## Saída do ipcalc explicada

```
Address:   192.168.1.7       → seu IP
Netmask:   255.255.255.0 = 24 → máscara (/24 em formato legível)
Network:   192.168.1.0/24    → endereço da rede (reservado)
HostMin:   192.168.1.1       → primeiro IP utilizável (geralmente o roteador)
HostMax:   192.168.1.254     → último IP utilizável
Broadcast: 192.168.1.255     → reservado — mensagens chegam a todos da rede
Hosts/Net: 254               → dispositivos que cabem na rede
```

### Por que 254 e não 256?

| Endereço | Reservado para | Exemplo /24 |
|---|---|---|
| Primeiro (.0) | Identificar a rede | 192.168.1.0 |
| Último (.255) | Broadcast | 192.168.1.255 |

256 - 2 = **254 hosts utilizáveis**

---

## Diferença entre /24 e /16 na prática

| | /24 | /16 |
|---|---|---|
| Rede | 192.168.**1** | 10.**0** |
| Hosts livres | último bloco | dois últimos blocos |
| HostMin | 192.168.1.**1** | 10.0.**0.1** |
| HostMax | 192.168.1.**254** | 10.0.**255.254** |
| Total hosts | 254 | 65.534 |

No /24 só o último bloco muda. No /16 os dois últimos blocos são livres.

---

## Endereços IP privados (RFC 1918)

Faixas reservadas para redes internas — não roteáveis na internet:

| Faixa | CIDR | Uso |
|---|---|---|
| 10.0.0.0 | /8 | redes corporativas, AWS VPC |
| 172.16.0.0 | /12 | Docker, ambientes internos |
| 192.168.0.0 | /16 | redes domésticas |

> Sua rede (`192.168.1.x`) e o Docker (`172.17.x.x`) usam faixas privadas — por isso ninguém na internet acessa diretamente.

---

## Como dispositivos se comunicam

```
192.168.1.7 → 192.168.1.5 (mesmo /24)
  └── Linux verifica: mesmo prefixo de rede?
       └── Sim → manda direto, sem passar pelo gateway

192.168.1.7 → 8.8.8.8 (fora do /24)
  └── Linux verifica: mesmo prefixo de rede?
       └── Não → manda para o gateway (192.168.1.1) → internet
```

---

## Conexão com AWS VPC

| Conceito local | Equivalente na AWS |
|---|---|
| Sua rede `192.168.1.0/24` | Subnet na VPC |
| VPC inteira | `10.0.0.0/16` (padrão AWS) |
| Subnet pública | `10.0.1.0/24` — acessa internet |
| Subnet privada | `10.0.2.0/24` — sem acesso direto |
| Gateway `192.168.1.1` | Internet Gateway (IGW) |
| IP privado `192.168.1.7` | IP privado da instância EC2 |

> Na AWS a subnet também reserva 5 IPs (não 2): rede, gateway, DNS, reservado futuro e broadcast.
> Um /24 na AWS dá 251 hosts utilizáveis (256 - 5).
