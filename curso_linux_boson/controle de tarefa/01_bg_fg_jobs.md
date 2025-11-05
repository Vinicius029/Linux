# Comandos bg, fg, jobs

## O que são tarefas (jobs)
Quando você executa um comando no terminal, ele é tratado como uma tarefa (ou job).
Cada job pode estar em:
* Foreground (primeiro plano): o terminal fica “preso” à execução.
* Background (segundo plano): o comando roda em paralelo, liberando o terminal.

## Executando tarefas em background
Para rodar um comando em segundo plano, basta colocar `&` no final:
```bash
   gimp &
```
Saida: [1] 1234, onde [1] é o número do job, e 1234 é o PID do processo

## Ver tarefas ativas com jobs
```bash
   [1]-  Running    gimp &
   [2]+  Stopped    nano teste.txt
```
* *Running*: em execução
* *Stopped*: pausada (suspensa com `ctrl+Z`

## Pausar uma tarefa (Ctrl + Z)
Quando você pressiona Ctrl + Z, a tarefa atual é suspensa (Stopped) — ela não é encerrada, apenas pausada.
```bash
  sleep 100
```
* (pressione Ctrl + Z)
```bash
  [1]+ Stopped sleep 100
```
## Retomar tarefa em background (bg)
```bash
  bg %1
```
* Faz o job número 1 continuar em segundo plano.

## Retomar tarefa em foreground (fg)
```bash
  fg %1
```
* Traz o job número 1 de volta ao primeiro plano (foreground).

## Resumo
| Comando    | Função                                      | Exemplo             |
| ---------- | ------------------------------------------- | ------------------- |
| `jobs`     | Lista as tarefas em execução ou pausadas    | `jobs`              |
| `Ctrl + Z` | Pausa a tarefa atual (Stopped)              | —                   |
| `bg %n`    | Retoma a tarefa em background               | `bg %1`             |
| `fg %n`    | Retoma a tarefa em foreground               | `fg %1`             |
| `kill %n`  | Encerra o job pelo número                   | `kill %2`           |
| `&`        | Executa o comando diretamente em background | `ping google.com &` |



