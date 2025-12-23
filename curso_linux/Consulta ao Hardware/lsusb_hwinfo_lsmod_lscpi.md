# lsusb — Lista dispositivos USB
Mostra todos os dispositivos USB conectados ao sistema.
```bash
    lsusb

    # Saida
    Bus 001 Device 002: ID 8087:8000 Intel Corp.

    # Verificar com mais detalhes
    lsusb -v
```
- Identificar pendrives
- Teclados/mouses USB
- Placas de rede Wi-Fi USB
- Adaptadores Bluetooth

# lspci — Lista dispositivos PCI
Mostra componentes conectados ao barramento PCI, como:
- Placas de vídeo
- Placas de rede
- Controladores USB
- Controladores SATA/NVMe
```bash
    # Comando
    lspci

    # Com detalhes
    lspci -v
```

# lsmod — Lista módulos do kernel carregados
Mostra drivers carregados no kernel (módulos).
```bash
    # Comando
    lsmod

    # Ver detalhe especifico de um modulo
    modinfo <modulo>
```
- Ver drivers carregados
- Diagnóstico de hardware
- Saber se um driver está ativo

# hwinfo — Informações detalhadas do hardware
Ele exibe informações completas do sistema, incluindo:
- CPU
- BIOS
- Rede
- Periféricos
- PCI
- USB
- Processes, sensores etc.
```bash
    # Comando
    sudo hwinfo

    # Ou filtrar
    sudo hwinfo --cpu
    sudo hwinfo --network
```

# lsdev — Lista interrupções, DMA e I/O
Mostra recursos de hardware alocados pelo kernel:
- IRQs (interrupções)
- Endereços de I/O
- Canais DMA
```bash
    # Ajuda no diagnóstico de conflitos de hardware — mais técnico, mais raro em sistemas modernos, mas ainda útil.
    lsdev
```

# Quando usar qual:
| Comando  | O que Ele Mostra                           |
| -------- | ------------------------------------------ |
| `lsusb`  | Dispositivos USB                           |
| `lspci`  | Hardware PCI (vídeo, rede, etc.)           |
| `lsmod`  | Drivers carregados pelo kernel             |
| `hwinfo` | Inventário completo e detalhado do sistema |
| `lsdev`  | Recursos alocados (IRQ, DMA, I/O)          |


