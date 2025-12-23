# Processos, Sinais e os comandos kill e killall — Linux
Um processo é qualquer programa em execução no Linux.
Cada processo recebe um PID (Process ID) — um número único usado pelo sistema para identificá-lo.
* Quando você abre o Firefox, ele vira um processo com um PID.
* Quando executa um script, o shell cria um processo filho para ele.

## Comandos para visualizar processos
| Comando      | Descrição                             |
| ------------ | ------------------------------------- |
| `ps`         | Mostra os processos atuais do usuário |
| `ps aux`     | Mostra todos os processos do sistema  |
| `top`        | Exibe processos em tempo real         |
| `htop`       | Versão interativa e colorida do `top` |
| `pgrep nome` | Mostra o PID de um processo pelo nome |

* Mostra os processos que contêm “firefox” no nome.
```bash
    ps aux | grep firefox
```

## O que são sinais (signals)
Um sinal é uma forma do sistema comunicar algo a um processo — por exemplo, mandá-lo parar, pausar, continuar, recarregar configurações, etc.

Os sinais são identificados por nomes *(como SIGTERM)* ou números *(como 15)*.

### Principais sinais usados
| Sinal     | Número | Descrição                                                         |
| --------- | ------ | ----------------------------------------------------------------- |
| `SIGTERM` | 15     | Pede para encerrar o processo **educadamente** (padrão do `kill`) |
| `SIGKILL` | 9      | Mata o processo **imediatamente**, sem chance de salvar nada      |
| `SIGHUP`  | 1      | Recarrega a configuração do processo (muito usado em daemons)     |
| `SIGSTOP` | 19     | Pausa o processo                                                  |
| `SIGCONT` | 18     | Continua um processo pausado                                      |

## Comando kill
O comando kill envia um sinal para um processo específico usando seu PID.

* `kill 1234`: Encerrar processo normalmente. Envia SIGTERM (15) para o processo 1234.
* `kill -9 1234`: Encerrar à força. Envia SIGKILL (9) — força a parada imediata.
* `kill -1 1234`: Recarregar configuração. Envia SIGHUP (1) para o processo recarregar as configurações.

## Comando killall
O comando killall funciona como o kill, mas ao invés de usar o PID, ele mata todos os processos que tenham o mesmo nome.

* Encerrar todos os processos de um programa
```bash
    sudo killall firefox
```
* Envia o sinal SIGKILL (9) para todos os processos do Firefox.
```bash
    sudo killall -9 firefox
```
* Pausar e retomar processos
```bash
    sudo killall -STOP firefox
    sudo killall -CONT firefox
```

## Resumo
| Comando           | Função                                | Exemplo              |             |
| ----------------- | ------------------------------------- | -------------------- | ----------- |
| `ps aux`          | Lista processos                       | `ps aux              | grep nginx` |
| `kill PID`        | Envia sinal a um processo             | `kill 1234`          |             |
| `kill -9 PID`     | Mata o processo à força               | `kill -9 1234`       |             |
| `killall nome`    | Mata todos os processos com esse nome | `killall firefox`    |             |
| `killall -9 nome` | Mata todos à força                    | `killall -9 firefox` |             |
| `SIGHUP (1)`      | Recarrega                             | `kill -1 PID`        |             |
| `SIGTERM (15)`    | Encerra normalmente                   | `kill PID`           |             |
| `SIGKILL (9)`     | Mata forçado                          | `kill -9 PID`        |             |
