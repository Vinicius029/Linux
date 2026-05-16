# Redes para DevOps — Aula 04: AWS VPC na prática

## Comparação direta: Linux vs AWS

> Use essa tabela para nunca esquecer o que cada coisa faz

| Linux (o que você já conhece) | AWS (o que você acabou de criar) |
|---|---|
| Sua rede `192.168.1.0/24` | **VPC** `10.0.0.0/16` |
| Seu roteador `192.168.1.1` | **Internet Gateway (IGW)** |
| `ip route show` (tabela de rotas) | **Route Table** |
| `default via 192.168.1.1` | rota `0.0.0.0/0 → IGW` |
| `ufw allow 22, 80, 443` | **Security Group** |
| Rede local `192.168.1.0/24` | **Subnet pública** `10.0.1.0/24` |
| Rede isolada sem gateway | **Subnet privada** `10.0.2.0/24` |
| IP privado `192.168.1.7` | IP privado da instância EC2 |

---

## O que você construiu

```
Internet
    │
    ▼
igw-devops-estudo          ← roteador da VPC
    │
    ▼
vpc-devops-estudo (10.0.0.0/16)
    │
    ├── subnet-publica (10.0.1.0/24) — us-east-1a
    │       ├── rtb-publica: 0.0.0.0/0 → IGW  ← tem saída pra internet
    │       └── sg-devops-estudo: porta 22, 80, 443 liberadas
    │
    └── subnet-privada (10.0.2.0/24) — us-east-1b
            └── route table padrão: sem rota para IGW  ← isolada
```

---

## Passo a passo do que foi criado

### 1. VPC

- **O que é:** sua rede privada na AWS — equivalente à sua rede doméstica
- **CIDR:** `10.0.0.0/16` → 65.534 IPs disponíveis
- **Por que /16:** espaço suficiente para criar várias subnets /24 dentro

```
VPC 10.0.0.0/16 comporta, por exemplo:
  subnet 10.0.1.0/24  → servidores web
  subnet 10.0.2.0/24  → bancos de dados
  subnet 10.0.3.0/24  → serviços internos
  ... até 256 subnets /24 diferentes
```

### 2. Subnets

| Subnet | CIDR | AZ | Tipo |
|---|---|---|---|
| subnet-publica | 10.0.1.0/24 | us-east-1a | acessa internet via IGW |
| subnet-privada | 10.0.2.0/24 | us-east-1b | isolada, sem rota para IGW |

> Subnets em zonas de disponibilidade (AZ) diferentes = alta disponibilidade.
> Se uma AZ cair, a outra continua funcionando.

### 3. Internet Gateway (IGW)

**IGW = roteador da sua VPC**

- Sem IGW, nenhuma instância EC2 acessa a internet
- Precisa ser criado E anexado à VPC — só criar não basta
- Uma VPC tem no máximo 1 IGW

```
Sem IGW:  EC2 → ??? → internet  (não funciona)
Com IGW:  EC2 → IGW → internet  (funciona)
```

### 4. Route Table

**Route Table = tabela do `ip route show`**

| Route Table | Rota | Destino | Para quê |
|---|---|---|---|
| rtb-publica | `10.0.0.0/16` | local | comunicação interna da VPC |
| rtb-publica | `0.0.0.0/0` | IGW | saída para internet |
| padrão (privada) | `10.0.0.0/16` | local | só comunicação interna |

> A rota `0.0.0.0/0 → IGW` é o equivalente exato do
> `default via 192.168.1.1` do seu Linux.
> É a rota padrão — "qualquer destino desconhecido, manda pro roteador".

### 5. Security Group

**Security Group = ufw da AWS**

| Regra | Protocolo | Porta | Origem | Equivalente ufw |
|---|---|---|---|---|
| SSH | TCP | 22 | 0.0.0.0/0 | `ufw allow 22` |
| HTTP | TCP | 80 | 0.0.0.0/0 | `ufw allow 80` |
| HTTPS | TCP | 443 | 0.0.0.0/0 | `ufw allow 443` |

**Diferenças importantes do Security Group vs ufw:**

| | ufw (Linux) | Security Group (AWS) |
|---|---|---|
| Padrão | DENY ALL | DENY ALL |
| Stateful | não | **sim** |
| Onde fica | dentro do SO | fora da instância EC2 |
| Se bloquear SSH | pode travar o servidor | corrige pelo console AWS |

> **Stateful** = se você libera a entrada na porta 80, a resposta sai automaticamente.
> No ufw você precisa gerenciar entrada e saída separadamente.

---

## Erro que aconteceu (e como evitar)

Durante a criação do Security Group, a porta HTTPS foi digitada como **433** em vez de **443**.

| Porta errada | Porta certa | Serviço |
|---|---|---|
| 433 | **443** | HTTPS |

> Dica: sempre conferir as regras após criar. Uma porta errada derruba
> o HTTPS de toda a aplicação sem nenhuma mensagem de erro clara.

---

## Por que subnet pública e privada?

```
Internet → IGW → subnet-publica → servidor web (EC2)
                                        │
                                        │ comunicação interna
                                        ▼
                               subnet-privada → banco de dados (EC2)
```

- O banco de dados fica **invisível para a internet** — ninguém de fora acessa
- O servidor web acessa o banco internamente via IP privado
- Mesmo padrão do seu MySQL: escuta só em `127.0.0.1`, não exposto

---