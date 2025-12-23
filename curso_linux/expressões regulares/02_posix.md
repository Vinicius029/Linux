# POSIX
Os conjuntos POSIX são escritos entre colchetes duplos [: :] dentro de [].

## Principais classes POSIX
| Classe       | Significado                            | Equivalente                           | Exemplo                           |
| ------------ | -------------------------------------- | ------------------------------------- | --------------------------------- |
| `[:alnum:]`  | Letras e números                       | `[A-Za-z0-9]`                         | `grep "[[:alnum:]]" arquivo.txt`  |
| `[:alpha:]`  | Somente letras                         | `[A-Za-z]`                            | `grep "[[:alpha:]]" arquivo.txt`  |
| `[:digit:]`  | Números de 0 a 9                       | `[0-9]`                               | `grep "[[:digit:]]" arquivo.txt`  |
| `[:lower:]`  | Letras minúsculas                      | `[a-z]`                               | `grep "[[:lower:]]" arquivo.txt`  |
| `[:upper:]`  | Letras maiúsculas                      | `[A-Z]`                               | `grep "[[:upper:]]" arquivo.txt`  |
| `[:space:]`  | Espaços, tabulações e quebras de linha | `[\t\n ]`                             | `grep "[[:space:]]" arquivo.txt`  |
| `[:punct:]`  | Pontuação                              | `[,.:;!?()]`                          | `grep "[[:punct:]]" arquivo.txt`  |
| `[:print:]`  | Caracteres visíveis (imprimíveis)      | letras, números e símbolos            | `grep "[[:print:]]" arquivo.txt`  |
| `[:graph:]`  | Caracteres visíveis, exceto espaço     | letras, números e símbolos sem espaço | `grep "[[:graph:]]" arquivo.txt`  |
| `[:cntrl:]`  | Caracteres de controle (não visíveis)  | Ex: tab, newline                      | `grep "[[:cntrl:]]" arquivo.txt`  |
| `[:xdigit:]` | Dígitos hexadecimais                   | `[0-9A-Fa-f]`                         | `grep "[[:xdigit:]]" arquivo.txt` |

## Combinando classes POSIX
combinar várias classes dentro de um mesmo conjunto.
```bash
    grep "[[:digit:][:alpha:]]" teste.txt
```
* Encontra linhas que têm números ou letras.
## Negando uma classe
Use o acento circunflexo (^) dentro dos colchetes para negar.
```bash
    grep "[^[:digit:]]" teste.txt
```
* Mostra linhas que não contêm números.
