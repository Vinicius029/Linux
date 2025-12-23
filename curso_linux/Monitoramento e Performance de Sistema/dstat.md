# Entendendo o comando `dstat` no Linux

O comando `dstat` é usado para **monitorar o desempenho do sistema em tempo real**, combinando informações de ferramentas como `vmstat`, `iostat`, `netstat` e `top`.

---

## Exemplo de saída

```bash
vinicius@vinicius-Dev:~/Documentos/linux$ dstat
You did not select any stats, using -cdngy by default.
--total-cpu-usage-- -dsk/total- -net/total- ---paging-- ---system--
usr sys idl wai stl| read  writ| recv  send|  in   out | int   csw 
 15   4  76   5   0|2352k  665k|   0     0 |   0     0 |3606  4607 

| Categoria           | Significado                                 |
| ------------------- | ------------------------------------------- |
| **total-cpu-usage** | Uso da CPU (usuário, sistema, ocioso, etc.) |
| **dsk/total**       | Leitura e gravação de disco                 |
| **net/total**       | Tráfego de rede                             |
| **paging**          | Paginação de memória (swap)                 |
| **system**          | Interrupções e trocas de contexto           |

| Coluna  | Descrição                           |
| ------- | ----------------------------------- |
| **usr** | Tempo em processos de usuário       |
| **sys** | Tempo em processos do sistema       |
| **idl** | Tempo ocioso                        |
| **wai** | Esperando I/O (disco, rede, etc.)   |
| **stl** | Tempo “roubado” por máquina virtual |

| Coluna   | Descrição                    |
| -------- | ---------------------------- |
| **read** | Leitura de disco por segundo |
| **writ** | Escrita de disco por segundo |


| Coluna   | Descrição                   |
| -------- | --------------------------- |
| **recv** | Bytes recebidos por segundo |
| **send** | Bytes enviados por segundo  |

| Coluna  | Descrição                    |
| ------- | ---------------------------- |
| **in**  | Páginas trazidas da swap     |
| **out** | Páginas enviadas para a swap |

| Coluna  | Descrição                      |
| ------- | ------------------------------ |
| **int** | Interrupções por segundo       |
| **csw** | Trocas de contexto por segundo |

| Comando                  | Função                             |
| ------------------------ | ---------------------------------- |
| `dstat -c`               | Mostra apenas CPU                  |
| `dstat -m`               | Mostra memória                     |
| `dstat -n`               | Mostra rede                        |
| `dstat -d`               | Mostra disco                       |
| `dstat -t`               | Mostra horário                     |
| `dstat -cdmn`            | Mostra CPU, disco, memória e rede  |
| `dstat --top-cpu`        | Mostra o processo que mais usa CPU |
| `dstat --output log.csv` | Salva os dados em arquivo `.csv`   |
