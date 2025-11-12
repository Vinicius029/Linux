## Extended Regular Expressions
Use o modo estendido com -E (ou o comando egrep):
```bash
    grep -E '[[:alnum:]_.-]+@[[:alnum:]_.-]+\.[[:alpha:]]+' arq.txt
```
* [[:alnum:]_.-]+ → letras, números, underscore, ponto e hífen, repetidos.
* @ → símbolo de arroba.
* \. → ponto literal.
* [[:alpha:]]+ → letras após o ponto (como “com”, “br”, etc).

## Perl-compatible regex
Se sua versão do grep suportar regex Perl, pode usar \w:
```bash
    grep -P '\w+@\w+\.\w+' arq.txt
```
* -P → ativa o modo Perl regex, que entende \w, \d, +, etc.
* Essa forma funciona exatamente como você tentou, mas só se seu grep tiver suporte a -P (no Ubuntu e derivados geralmente tem).

## Exemplo
### `\w` permite procurar caracteres
```bash
    echo "teste@gmail.com" > arq.txt
    grep -P '\w+@\w+\.\w+' arq.txt
```
Resultado:
```bash
    teste@gmail.com
```
### `\d` permite procurar números
```bash
    echo "012.456.789-10" >> arq.txt
    grep -P '\d{3}.\d{3}.\d{3}-\d{2}' arq.txt
```
Resultado:
```bash
    012.456.789-10
```