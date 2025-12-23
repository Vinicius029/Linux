# vmstart

Este comando reporta informações sobre processos, memória, paginação, blocos de i/o, traps e atividade de CPU.


* -S M Usa a unidade MB em vez do padrão KB
* -a Mostrar memória ativa e inativa
* -d Mostra estatísticas de discos
* -p partição Mostra informações de R/W na partição especificada
* -s Mostra estatísticas em formato de tabela

## Comando vmstart - campos

1. `procs` 
    * r: N° de processos esperando para rodar
    * b: N° de processos em dormência ininterrupta
2. `memory`
    * swpd: Memória virtual usada
    * free: Memória livre
    * buff: Memória usada em cache
3. `swap`
    * si: Memória trocada a partir do disco
    * so: Memória trocada para o disco
4. `io`
    * bi: Blocos recebidos de um dispositivo de bloco (blocos/s)
    * bo: Blocos enviados a um dispositivo de bloco (blocos/s)
5. `system`
    * in: N° de interrupções por segundo, incluindo clock
    * cs: N° de mudanças de contexto por segundo
6. `cpu`
    * us: Tempo gasto rodando código que não é kernel
    * sy: Tempo gasto rodando código do kernel
    * id: Tempo gasto em ociosidade
    * wa: Tempo gasto esperando por I/O

## Comando:

- Exibe os processos, memoria
```bash
   vmstart -S M
```
- Exibe os processos, memoria em MB
```bash
    vmstart -S M
```
