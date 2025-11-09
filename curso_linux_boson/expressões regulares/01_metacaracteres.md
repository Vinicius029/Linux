# Expressões Regulares - Metacaracteres
Expressões regulares são padrões de busca de texto.
Elas servem para encontrar, filtrar ou substituir palavras e caracteres em arquivos ou saídas de comandos.

No Linux, são usadas em comandos como:
```bash
    grep, sed, awk, egrep, find
```
## Metacaracteres principais
Os metacaracteres são símbolos especiais que mudam o significado normal dos caracteres.
Eles permitem fazer buscas mais poderosas.

### `.` ponto
Representa qualquer caractere único (exceto nova linha).
O ponto “substitui” qualquer letra.
```bash
    grep, sed, awk, egrep, find
```
### `^` circunflexo
Representa o início da linha.
```bash
    grep "^vinicius" nomes.txt
```
* Mostra todas as linhas que começam com “vinicius”.
### `$` cifrão
Representa o final da linha.
```bash
    grep "gmail.com$" emails.txt
```
* Mostra todas as linhas que terminam com “gmail.com”.
### `*` asterisco
Significa “zero ou mais vezes” o caractere anterior.
```bash
    grep "lo*l" arquivo.txt
```
* Encontra: ll, lol, lool, loool, etc.
### `[]` colchetes
Cria uma lista de possíveis caracteres.
```bash
    grep "c[aou]sa" arquivo.txt
```
* Encontra: casa, cousa, cosa
### `[^ ]` colchetes com ^ dentro
Significa negação → “qualquer caractere exceto esses”.
```bash
    grep "c[^a]sa" arquivo.txt
```
* Encontra: cbsa, ccsa, mas não casa.
### `\` barra invertida
Usada para escapar metacaracteres, tornando-os “normais”.
```bash
    grep "\." arquivo.txt
```
* Procura um ponto literal (.), e não “qualquer caractere”.
### `|` pipe dentro da regex
Significa OU lógico (alternativa).
```bash
    grep "gato|cachorro" animais.txt
```
* Encontra linhas com “gato” ou “cachorro”.
### `()` parênteses
Usados para agrupar partes da expressão.
```bash
    grep "\(foo\|bar\)" arquivo.txt
```
* Encontra “foo” ou “bar” dentro de um grupo.

## Resumo
| Metacaractere | Significado            | Exemplo      | Resultado             |            |                  |
| ------------- | ---------------------- | ------------ | --------------------- | ---------- | ---------------- |
| `.`           | Qualquer caractere     | `c.t`        | cat, cot, cut         |            |                  |
| `^`           | Início da linha        | `^vinicius`  | começa com vinicius   |            |                  |
| `$`           | Fim da linha           | `gmail.com$` | termina com gmail.com |            |                  |
| `*`           | Zero ou mais vezes     | `lo*l`       | ll, lol, loool        |            |                  |
| `[]`          | Conjunto de caracteres | `c[aou]sa`   | casa, cousa           |            |                  |
| `[^]`         | Negação                | `c[^a]sa`    | ccsa, cbsa            |            |                  |
| `             | `                      | OU lógico    | `gato                 | cachorro`  | gato ou cachorro |
| `()`          | Agrupamento            | `(foo        | bar)`                 | foo ou bar |                  |
| `\`           | Escapa metacaractere   | `\.`         | ponto literal         |            |                  |
