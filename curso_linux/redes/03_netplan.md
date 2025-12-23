# Netplan
O Netplan é o novo sistema padrão de configuração de rede no Ubuntu.

Ele usa arquivos YAML localizados em:
```bash
    /etc/netplan/
```
Esses arquivos controlam todas as interfaces (cabo, Wi-Fi, etc.)
E o Netplan aplica as configurações usando:
* NetworkManager (para desktops)
* systemd-networkd (para servidores)

## Onde ficam as configurações agora
Veja o conteúdo da pasta:
```bash
    ls /etc/netplan
```
* Você verá algo como:
```bash
    01-network-manager-all.yaml
```
## Exemplo de arquivo Netplan
# /etc/netplan/01-network-manager-all.yaml
```bash
    network:
    version: 2
    renderer: NetworkManager
    ethernets:
        enp1s0:
        dhcp4: true
```
IP estático
```bash
    # /etc/netplan/01-network-manager-all.yaml
network:
  version: 2
  renderer: NetworkManager
  ethernets:
    enp1s0:
      dhcp4: false
      addresses: [192.168.1.50/24]
      gateway4: 192.168.1.1
      nameservers:
        addresses: [8.8.8.8, 8.8.4.4]
```

## Aplicar as mudanças
Depois de editar o arquivo
```bash
    sudo netplan apply
```
Se quiser testar antes de aplicar de forma definitiva:
```bash
    sudo netplan try
```
## Relação com os comandos antigos
| Antes (ifupdown)            | Agora (Netplan)                              |
| --------------------------- | -------------------------------------------- |
| `/etc/network/interfaces`   | `/etc/netplan/*.yaml`                        |
| `ifup` / `ifdown`           | `netplan apply`                              |
| `ifconfig`                  | `ip addr` ou `nmcli`                         |
| `dhclient` (ainda funciona) | Pode usar junto, mas o Netplan gerencia o IP |

## Como ver informações da rede agora
| Função                         | Comando moderno                                   |
| ------------------------------ | ------------------------------------------------- |
| Ver IP e interfaces            | `ip addr show`                                    |
| Ver conexões do NetworkManager | `nmcli device status`                             |
| Ver detalhes de uma interface  | `nmcli device show enp1s0`                        |
| Renovar IP manualmente (DHCP)  | `sudo dhclient -r enp1s0 && sudo dhclient enp1s0` |
