# `ln`

No shell Linux (como o bash), metacaracteres são símbolos com significado especial.
Eles permitem:

Trabalhar com múltiplos arquivos.
* Fazer redirecionamentos.
* Criar expressões de busca.
* Controlar fluxo de comandos.

## Metacaracteres de expansão de nomes (globbing)
Esses são usados para selecionar arquivos no terminal.

| Símbolo          | Significado                                               | Exemplo                   | Resultado                                       |
| ---------------- | --------------------------------------------------------- | ------------------------- | ----------------------------------------------- |
| `*`              | Corresponde a **qualquer sequência de caracteres**        | `ls *.txt`                | Lista todos os arquivos que terminam com `.txt` |
| `?`              | Corresponde a **qualquer caractere único**                | `ls arquivo?.txt`         | Lista `arquivo1.txt`, `arquivoA.txt`, etc.      |
| `[ ]`            | Corresponde a **qualquer caractere dentro dos colchetes** | `ls arq[12].txt`          | Lista `arq1.txt` e `arq2.txt`                   |
| `[! ]` ou `[^ ]` | Corresponde a **qualquer caractere exceto os listados**   | `ls arq[!1].txt`          | Lista tudo exceto `arq1.txt`                    |
| `{ }`            | Expande **listas ou intervalos**                          | `echo arquivo{1,2,3}.txt` | Mostra `arquivo1.txt arquivo2.txt arquivo3.txt` |
| `~`              | Representa o **diretório home do usuário**                | `cd ~`                    | Vai para `/home/seu_usuario`                    |
| `.`              | Arquivos que **começam com ponto são ocultos**            | `ls -a`                   | Mostra arquivos ocultos (ex: `.bashrc`)         |

## Metacaracteres de redirecionamento
Eles controlam a entrada e saída de dados de comandos.

| Símbolo | Função                                                | Exemplo                                               |     |            |
| ------- | ----------------------------------------------------- | ----------------------------------------------------- | --- | ---------- |
| `>`     | Redireciona a **saída** para um arquivo (sobrescreve) | `ls > lista.txt`                                      |     |            |
| `>>`    | Redireciona a saída e **acrescenta** ao arquivo       | `echo "teste" >> log.txt`                             |     |            |
| `<`     | Redireciona a **entrada** de um comando               | `sort < nomes.txt`                                    |     |            |
| `2>`    | Redireciona **erros (stderr)** para um arquivo        | `ls /root 2> erros.txt`                               |     |            |
| `&>`    | Redireciona **saída e erros** juntos                  | `comando &> tudo.txt`                                 |     |            |
| `       | ` (pipe)                                              | Envia a saída de um comando **como entrada de outro** | `ls | grep .txt` |

## Operadores de controle de comandos
Servem para combinar, encadear ou condicionar comandos.

| Símbolo             | Função                                                       | Exemplo                     |                                            |           |   |                |
| ------------------- | ------------------------------------------------------------ | --------------------------- | ------------------------------------------ | --------- | - | -------------- |
| `;`                 | Executa vários comandos em sequência                         | `cd /etc; ls; pwd`          |                                            |           |   |                |
| `&&`                | Executa o segundo **somente se o primeiro for bem-sucedido** | `mkdir backup && cd backup` |                                            |           |   |                |
| `                   |                                                              | `                           | Executa o segundo **se o primeiro falhar** | `cd pasta |   | echo "Falhou"` |
| `&`                 | Executa o comando **em segundo plano**                       | `sleep 10 &`                |                                            |           |   |                |
| `()`                | Executa comandos em um **subshell**                          | `(cd /tmp && ls)`           |                                            |           |   |                |
| `{ }`               | Agrupa comandos no **mesmo shell**                           | `{ cd /var; ls; }`          |                                            |           |   |                |
| `!`                 | Nega (inverte o resultado) ou repete comandos no histórico   | `!ls` repete o último `ls`  |                                            |           |   |                |
| `` ` ` `` ou `$( )` | **Executa comandos dentro de comandos**                      | `echo "Hoje é $(date)"`     |                                            |           |   |                |

## Exemplo prático combinando tudo
```bash
   ls *.log | grep "erro" > erros.txt 
```
* ls *.log → lista todos os arquivos .log
* | grep "erro" → filtra linhas que contêm “erro”
* > erros.txt → salva a saída no arquivo erros.txt