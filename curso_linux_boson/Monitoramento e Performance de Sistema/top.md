# top

Fornece uma visão em tempo real do sistema em execução

* -d atraso Especifica o atraso em segundos entre as atualizações de tela. O padrão é 5 segundos.
* -i Ignora Processos ociosos
* -n num Exibe num iterações e depois termina
* -b Roda em modo de batch. Util para mandar a saída de top para outros programas ou um arquivo.

## Comando top - opções interativas

* h Gera uma tela de ajuda
* k Termina um processo (será pedido seu PID)
* q Sai do programa
* r Modifica a prioridade de um processo (renice); Serão pedidos seu PID e valor nice (valores positivos tem menor prioridade)
* s Modifica o atraso em segundos entre as atualizações. Será pedido o tempo em segundos.

## Descrição dos campos de top

* PID o PID de cada processo
* USER Usuário proprietário do processo
* PR Prioridade da tarefa
* NI Valor Nice da tarefa
* VIRT Memória virtual usada pelo processo
* RES Memória física usuada pelo processo
* SHR Memória compartilhada usada pelo processo
* S Estado da tarefa (S = sleeping, R = running, T = stopped, Z = zombie)
* %CPU % de tempo de CPU usada pela tarefa
* %MEM % de memória física usada pelo processo
* TIME+ Tempo total de atividade da tarefa desde que ela foi iniciada
* COMMAND Nome do processo

## Comando:

- Exibe os processos
```bash
    top
```
- Exibe os processos, de chrome
```bash
   top -i | grep chrome
```
