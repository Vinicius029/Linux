# dmesg

significa display message buffer, e ele mostra mensagens registradas pelo kernel (núcleo do sistema).<br/>
Essas mensagens incluem eventos de hardware, drivers, inicialização do sistema, erros e logs importantes.<br/>
<hr>

### Quando ele é útil?

Para diagnosticar problemas de hardware
- USB falhou?
- HD desconectou?
- Rede caiu?

Para verificar se um dispositivo foi reconhecido ao conectar:

- Pen drive, HD externo, placa Wi-Fi, etc.
- Para monitorar erros do sistema
- Para acompanhar logs ao subir o Linux (boot)

## Comandos

```bash
    # Mostrar mensagens do kernel
    dmesg

    # Ver apenas as mensagens sobre usb
    dmesg | grep usb

    # Buscar erros
    dmesg | grep -i "error"

    # Buscar mensagens em tempo real
    dmesg -w

    # Mostra mensagem categorizadas e adiciona timestamps
    dmesg -T

    # Verificar ultimas mensagens
    dmesg | tail
```

## Diretorio do arquivo
```bash
    /var/log/kern.log
    /var/log/messages.log # Em algumas distros
```

## Resumo
| O que é         | Mostra mensagens do kernel                      |
| --------------- | ----------------------------------------------- |
| Para que serve  | Debug de hardware, drivers, boot                |
| Exemplos de uso | Ver se um USB foi detectado, identificar falhas |
| Onde ver também | `/var/log/kern.log`                             |
