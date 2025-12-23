# Redirecionamento e Pipes no Linux

## O que são `stdint, stdout e stderr`
Todo comando no Linux trabalha com três fluxos padrão:
| Nome       | Significado       | Função                              | Símbolo |
| ---------- | ----------------- | ----------------------------------- | ------- |
| **stdin**  | *Standard Input*  | Entrada padrão (o `que você digita)  | `0`     |
| **stdout** | *Standard Output* | Saída padrão (resultado do comando) | `1`     |
| **stderr** | *Standard Error*  | Saída de erros (mensagens de erro)  | `2`     |

Exemplo de stdin:
```bash
    cat arquivo.txt
```
* Comando `cat` lê stdin (entrada - o arquivo)
* Mostra o conteúdo em stdout (tela).
* Se o arquivo não existir, o erro vai para stderr.

###  Redirecionamento de saída (stdout)
Serve para enviar a saída de um comando para um arquivo em vez da tela.
| Comando | Explicação                                        |
| ------- | ------------------------------------------------- |
| `>`     | Redireciona e **substitui** o conteúdo do arquivo |
| `>>`    | Redireciona e **acrescenta** ao final do arquivo  |

## Redirecionamento de erros (stderr)
Para redirecionar somente os erros, usamos o identificador 2>.
```bash
    ls pasta_inexistente 2> erros.txt
```
* A mensagem de erro não vai aparecer na tela — será salva em erros.txt.

## Pipes
O pipe (|) conecta o stdout de um comando ao stdin de outro.
Ou seja: o resultado de um comando vira a entrada do próximo.
```bash
    ls | grep .txt
```
* s mostra todos os arquivos.
* O grep .txt filtra apenas os que têm “.txt”.

### Resumo final:

stdin → entrada (teclado, arquivo, pipe)

stdout → saída normal (tela)

stderr → mensagens de erro

Redirecionar é controlar para onde vai o resultado ou o erro

Pipes conectam um comando ao outro