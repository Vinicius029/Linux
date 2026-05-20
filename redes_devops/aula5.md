# Redes para DevOps — Aula 05: EC2 na prática

## O que será construido

Um servidor web real na AWS, acessível pela internet, com firewall configurado e Nginx servindo HTTP.

```
Você (192.168.1.7)
    │
    │ SSH / HTTP
    ▼
52.20.124.3 (Elastic IP)
    │
    ▼
igw-devops-estudo (Internet Gateway = roteador da VPC)
    │
    ▼
subnet-publica (10.0.1.0/24)
    │
    ▼
sg-devops-estudo (Security Group = firewall)
    │
    ▼
EC2 ip-10-0-1-124 (Ubuntu 24.04)
    └── Nginx rodando na porta 80
```

---

## Passo a passo do que foi feito

### 1. Key Pair (chave SSH)

```bash
# após baixar o .pem, mover e proteger
mkdir -p ~/.ssh
mv ~/Downloads/chave-devops-estudo.pem ~/.ssh/
chmod 400 ~/.ssh/chave-devops-estudo.pem
```

> `chmod 400` é obrigatório — o SSH recusa chaves com permissão aberta demais.

### 2. Instância EC2

| Campo | Valor |
|---|---|
| Nome | ec2-devops-estudo |
| AMI | Ubuntu Server 22.04 LTS |
| Tipo | t2.micro (free tier) |
| Key pair | chave-devops-estudo |
| VPC | vpc-devops-estudo |
| Subnet | subnet-publica |
| IP público | habilitado |
| Security Group | sg-devops-estudo |

> A subnet pública precisa ter "Habilitar endereço IPv4 público de atribuição automática" ativado — sem isso o DNS público fica vazio e o SSH não conecta.

### 3. Elastic IP

- IP temporário: muda toda vez que a instância para e inicia
- Elastic IP: fixo, associado à instância permanentemente
- IP alocado: **52.20.124.3**

### 4. Conectar via SSH

```bash
ssh -i ~/.ssh/chave-devops-estudo.pem ubuntu@52.20.124.3
```

### 5. Instalar Nginx

```bash
sudo apt update && sudo apt install nginx -y
```

---

## O que tem dentro da EC2 (ip a / ip route)

```
interface: enX0 (ethernet virtual)
IP privado: 10.0.1.124/24
Gateway:    10.0.1.1  ← IGW da VPC (o roteador)
DNS:        127.0.0.53 (mesmo que sua máquina local)
IP público: 52.20.124.3 (Elastic IP)
```

### Comparação: sua máquina vs EC2

| | Sua máquina | EC2 na AWS |
|---|---|---|
| Interface | wlp2s0 (Wi-Fi) | enX0 (ethernet virtual) |
| IP privado | 192.168.1.7/24 | 10.0.1.124/24 |
| Gateway | 192.168.1.1 (roteador) | 10.0.1.1 (IGW) |
| DNS | 127.0.0.53 | 127.0.0.53 |
| IP público | 189.90.234.134 (operadora) | 52.20.124.3 (Elastic IP) |

---

## Logs do Nginx

```bash
# ver requisições em tempo real
sudo tail -f /var/log/nginx/access.log
```
---

## Security Group vs ufw na EC2

```bash
sudo ufw status
# Status: inactive
```

O ufw está inativo na EC2 — o Security Group já protege antes do tráfego chegar no sistema operacional.

### Diferenças importantes

| | Security Group | ufw |
|---|---|---|
| Onde fica | **fora** da instância (AWS) | **dentro** do sistema operacional |
| Gerenciado por | AWS | você |
| Stateful | **sim** — resposta sai automático | não |
| Se travar SSH | corrige pelo console AWS | servidor inacessível |
| Bloqueia | antes de chegar no SO | dentro do SO |

### Os três comportamentos de conexão

```bash
# porta bloqueada pelo Security Group → timeout
curl -v --connect-timeout 5 http://52.20.124.3:8080
# resultado: Connection timeout — pacote descartado pelo SG, nunca chegou na EC2

# porta liberada + serviço rodando → sucesso
curl -v --connect-timeout 5 http://52.20.124.3:80
# resultado: 200 OK — Nginx respondeu

# porta liberada + sem serviço → refused
# resultado: Connection refused — chegou na EC2 mas ninguém escuta lá
```

| Comportamento | Causa |
|---|---|
| `Connection timeout` | Security Group bloqueando |
| `Connection refused` | firewall ok, mas sem serviço na porta |
| `200 OK` | firewall liberado + serviço respondendo |

---

## Comandos úteis no servidor EC2

```bash
# ver interfaces e IPs
ip a

# ver rotas (gateway = IGW)
ip route show

# ver DNS
cat /etc/resolv.conf

# confirmar IP público
curl -s ifconfig.me

# ver portas abertas
sudo ss -tlnp

# logs do nginx em tempo real
sudo tail -f /var/log/nginx/access.log

# status do nginx
sudo systemctl status nginx
```

---

## ⚠️ Lembrete importante

A EC2 e o Elastic IP geram custo se ficarem rodando. Quando não estiver estudando:

```
Console AWS → EC2 → Instâncias → Seleciona a instância
→ "Estado da instância" → "Parar instância"
```

Para encerrar de vez e parar qualquer cobrança:
```
→ "Estado da instância" → "Terminar instância"
→ IPs elásticos → Seleciona → "Ações" → "Liberar endereço"
```

---
