# nice, renice

No Linux, cada processo tem uma prioridade de execução, que define quanto tempo de CPU ele recebe em relação a outros processos.

Essa prioridade é controlada pelo valor “nice” (nível de gentileza).
* Quanto mais alto o valor nice, menos prioridade o processo tem.
* Quanto mais baixo o valor nice, mais prioridade o processo ganha.

## Faixa de valores
Tipo de usuário	Faixa do valor nice
* Usuário comum	0 até +19
* Root (superusuário)	-20 até +19

Padrão: se você não definir nada, o processo é iniciado com nice = 0.

## nice
O comando nice é usado para iniciar um processo com uma prioridade específica.

⚙️ Sintaxe
```bash
    nice -n 10 ping google.com
```
Executa o comando ping com prioridade menor que o normal (mais “educado” com a CPU).

### Verificando o valor nice
comando top ou ps:
```bash
    ps -o pid,ni,comm
```
Saída:
```bash
    PID  NI COMMAND
    2345  10 ping
```

## renice
O renice serve para alterar a prioridade de um processo já em execução.

⚙️ Sintaxe
```bash
    sudo renice -5 -p 2345
```
Muda a prioridade do processo PID 2345 para -5 (mais alta prioridade).

**Apenas o root pode usar valores negativos.**

## Comparativo prático
| Valor nice | Prioridade        | Uso comum                                    |
| ---------- | ----------------- | -------------------------------------------- |
| -20        | Prioridade máxima | Processos críticos do sistema                |
| 0          | Padrão            | Programas normais                            |
| +10        | Menor prioridade  | Tarefas leves ou de segundo plano            |
| +19        | Prioridade mínima | Processos que não podem atrapalhar o sistema |

## Exemplos rápidos


#### Faz o backup sem deixar o sistema lento.
```bash
    sudo renice -10 -p 2500
```
* Dá mais CPU para o processo PID 2500.
#### Reduzir prioridade (menos CPU):
```bash
    sudo renice 10 -p 2500
```
## Resumo
| Comando                 | Função                                          | Exemplo                      |
| ----------------------- | ----------------------------------------------- | ---------------------------- |
| `nice -n valor comando` | Executa um comando com prioridade ajustada      | `nice -n 10 ping google.com` |
| `renice valor -p PID`   | Altera prioridade de um processo já em execução | `sudo renice -5 -p 2345`     |
| `ps -o pid,ni,comm`     | Verifica valores *nice*                         | `ps -o pid,ni,comm`          |
| Valor `nice` menor      | Maior prioridade                                | `-10`                        |
| Valor `nice` maior      | Menor prioridade                                | `+10`                        |
