# Redes para DevOps — Aula 02: Portas, Protocolos e Firewall (ufw)


Portas são como portas de entrada de um prédio — cada serviço escuta em uma porta específica esperando conexões. Seu servidor tem 65.535 portas disponíveis.

---

## Portas mais importantes

| Porta | Protocolo | Serviço | Observação |
|---|---|---|---|
| 22 | TCP | SSH | acesso remoto ao terminal |
| 80 | TCP | HTTP | web sem criptografia |
| 443 | TCP | HTTPS | web com criptografia (SSL) |
| 3306 | TCP | MySQL | banco de dados |
| 33060 | TCP | MySQL X Protocol | protocolo moderno do MySQL |
| 7070 | TCP | AnyDesk | acesso remoto de tela |
| 8082 | TCP | Nginx (alternativo) | segunda instância do servidor web |
| 53 | UDP/TCP | DNS | resolução de nomes |
| 631 | TCP | CUPS | serviço de impressora |

---

## TCP vs UDP

| | TCP | UDP |
|---|---|---|
| Confirmação | sim — espera OK antes de continuar | não — envia e não espera |
| Uso | SSH, HTTP, HTTPS, MySQL | DNS, streaming, jogos online |
| Analogia | carta com aviso de recebimento | panfleto jogado pela janela |

---

## Comandos para ver portas abertas

```bash
# Ver todas as portas em estado LISTEN
ss -tlnp

# Com sudo — mostra o nome do processo dono de cada porta
sudo ss -tlnp

# Filtrar só as que estão escutando
ss -tlnp | grep LISTEN
```

### O que significa o endereço de escuta

| Endereço | Significado |
|---|---|
| `0.0.0.0` | aceita conexão de qualquer IP — exposto na rede |
| `127.0.0.1` | só a própria máquina acessa — seguro |
| `[::]` | mesmo que 0.0.0.0 mas para IPv6 |
| `[::1]` | mesmo que 127.0.0.1 mas para IPv6 |

---

## ufw — Firewall do Linux

### Comandos essenciais

```bash
# Ver estado atual do firewall
sudo ufw status

# Ver estado com detalhes
sudo ufw status verbose

# Ver regras numeradas (melhor para gerenciar)
sudo ufw status numbered

# Ativar o firewall
sudo ufw enable

# Desativar o firewall
sudo ufw disable
```

### Gerenciar regras

```bash
# Liberar uma porta para qualquer IP
sudo ufw allow 80

# Bloquear uma porta
sudo ufw deny 8082

# Liberar porta só para sua rede local
sudo ufw allow from 192.168.1.0/24 to any port 8082

# Liberar porta só para um IP específico
sudo ufw allow from 192.168.1.5 to any port 8082

# Liberar porta com protocolo específico
sudo ufw allow 22/tcp

# Deletar regra pelo número (forma mais segura)
sudo ufw status numbered
sudo ufw delete 4

# Deletar regra pelo nome (só funciona se a regra não tiver IP de origem)
sudo ufw delete allow 80
```

---

## Como o ufw processa as regras

O ufw lê as regras **em ordem** e para na primeira que casar com a requisição.

```
Requisição chega → regra [1] casa? → sim: executa e para
                                   → não: vai para regra [2]
                                          casa? → sim: executa e para
                                                → não: vai para [3]...
                                                       sem regra: DENY (padrão)
```

### Exemplo prático (sua máquina)

```
[4] ALLOW from 192.168.1.0/24 → :8082   ← sua rede local cai aqui, acesso liberado
[5] DENY  from Anywhere       → :8082   ← qualquer outro IP cai aqui, bloqueado
```

> Regras mais específicas (com IP de origem) devem sempre vir **antes** das regras genéricas.

---

## Estado atual do seu firewall

```
[ 1] 22/tcp    ALLOW IN   Anywhere         ← SSH liberado
[ 2] 80/tcp    ALLOW IN   Anywhere         ← HTTP liberado
[ 3] 443/tcp   ALLOW IN   Anywhere         ← HTTPS liberado
[ 4] 8082      ALLOW IN   192.168.1.0/24   ← Nginx só rede local
[ 5] 22/tcp    ALLOW IN   Anywhere (v6)
[ 6] 80/tcp    ALLOW IN   Anywhere (v6)
[ 7] 443/tcp   ALLOW IN   Anywhere (v6)
```

---

## Erros comuns em produção

| Erro | O que acontece | Como evitar |
|---|---|---|
| `ufw enable` sem liberar porta 22 | perde acesso SSH ao servidor remoto | sempre `ufw allow 22` antes de `ufw enable` |
| Ordem errada de regras | DENY antes do ALLOW específico bloqueia quem deveria acessar | sempre colocar regras específicas antes das genéricas |
| Regras duplicadas | bagunça, difícil saber o que está valendo | usar `status numbered` e deletar pelo número |
| `ufw delete allow 8082` não funciona | regra tem IP de origem, nome não bate | sempre deletar pelo número |

---

## Conexão com AWS 

| Conceito local | Equivalente na AWS |
|---|---|
| `ufw allow 80` | Security Group — inbound rule porta 80 |
| `ufw allow from 192.168.1.0/24` | Security Group — source CIDR específico |
| `ufw deny` (padrão) | Security Group — deny all por padrão |
| Port Forwarding no roteador | Elastic IP + Internet Gateway |
| `0.0.0.0` (exposto) | `0.0.0.0/0` no Security Group |
| `127.0.0.1` (local) | sem regra de entrada no Security Group |
