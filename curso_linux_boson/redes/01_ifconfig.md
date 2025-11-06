# ifconfig e dhclient

## ifconfig — Interface Configuration
O comando ifconfig (interface configuration) é usado para exibir e configurar interfaces de rede no Linux.

**Ele foi substituído pelo comando ip em distribuições mais novas, mas ainda é muito usado por administradores e em scripts antigos.**

Ver informações das interfaces
```bash
    ifconfig
```
Ativar uma interface
```bash
    sudo ifconfig eth0 up
```
Desativar
```bash
    sudo ifconfig eth0 down
```
Atribuir IP manualmente do wi-fi
```bash
    sudo ifconfig wlp2s0 192.168.1.50 netmask 255.255.255.0
```

### Resumo
| Função               | Comando                                            | Exemplo          |
| -------------------- | -------------------------------------------------- | ---------------- |
| Ver interfaces       | `ifconfig`                                         | —                |
| Interface específica | `ifconfig eth0`                                    | Mostra só `eth0` |
| Subir interface      | `ifconfig eth0 up`                                 | —                |
| Derrubar interface   | `ifconfig eth0 down`                               | —                |
| Atribuir IP          | `ifconfig eth0 192.168.1.10 netmask 255.255.255.0` | —                |

## dhclient — DHCP Client
O comando dhclient é usado para solicitar ou renovar um endereço IP automaticamente via DHCP.
Ele conversa com o servidor DHCP (como o roteador da rede) e obtém:

* Endereço IP
* Máscara de rede
* Gateway
* DNS

O sistema envia uma requisição DHCP e recebe um IP válido da rede.
```bash
    sudo dhclient
```
Solicitar IP para uma interface específica
```bash
    sudo dhclient eth0
```
Forçar uma renovação (por exemplo, se o IP travou ou mudou a rede)
```bash
    sudo dhclient -r eth0   # Libera o IP atual
    sudo dhclient eth0      # Solicita novo IP
```

### Quando usar cada um
| Situação                           | Comando ideal                        | Explicação                          |
| ---------------------------------- | ------------------------------------ | ----------------------------------- |
| Ver ou configurar interface        | `ifconfig`                           | Visualizar e definir IP manualmente |
| Conectar-se automaticamente (DHCP) | `dhclient`                           | Solicita IP do roteador             |
| Renovar IP sem reiniciar           | `dhclient -r` + `dhclient`           | Renova configuração de rede         |
| Interface caiu / não tem IP        | `ifconfig eth0 up` + `dhclient eth0` | Restaura conexão                    |

Como o ifconfig está sendo substituído, os equivalentes modernos são:
```bash
    ip addr show             # mostra IPs e interfaces
    sudo ip link set eth0 up # ativa interface
    sudo dhclient eth0       # ainda serve para DHCP
```