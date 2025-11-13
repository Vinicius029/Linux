# sed — Editor de Streams (Substituição de Strings)

O sed (Stream Editor) é um editor de texto em linha de comando, usado para:
* Ler um arquivo ou entrada de texto (stream),
* Modificar esse texto (substituir, inserir, apagar),
* E exibir o resultado (sem alterar o arquivo, a menos que você peça).
“Stream” significa fluxo — o sed lê linha por linha do arquivo e aplica regras sobre esse fluxo.

## Estrutura básica do comando
```bash
    sed 's/padrao/substituicao/' arquivo
```
* s → significa substituir (substitute)
* padrao → texto que você quer procurar
* substituicao → texto que vai entrar no lugar

## Exemplos

Criar um arquivo teste
```bash
    echo -e "Linux é incrível\nLinux é poderoso\nEu uso Linux" > teste.txt
```
Substituir uma palavra simples
```bash
    sed 's/Linux/Ubuntu/' teste.txt
```
Saida:
```bash
    Ubuntu é incrível
    Ubuntu é poderoso
    Eu uso Ubuntu
```
#### **Por padrão, o sed mostra na tela a substituição, sem alterar o arquivo.**

### Aplicar em todas as ocorrências da 
Por padrão, o sed só substitui a primeira ocorrência de cada linha.<br/>
Para substituir todas as ocorrências, use o g (global) no final:
```bash
    sed 's/Linux/Ubuntu/g' teste.txt
```
### Gravar a alteração no arquivo
Para editar o arquivo diretamente, use -i (in-place):
```bash
    sed -i 's/Linux/Ubuntu/g' teste.txt
```
### Substituição com delimitador diferente
Nem sempre você precisa usar `/`.<br/>
Pode usar outro delimitador, como `#` ou `|`, útil quando há URLs ou paths.
```bash
    sed 's|/home/vinicius|/mnt/storage|' arquivo.txt
```
### Substituição sensível e insensível a maiúsculas
Por padrão, o sed diferencia maiúsculas de minúsculas.<br/>
Para ignorar case, use o I (ou i, depende da versão):
```bash
    sed 's/linux/Ubuntu/I' teste.txt
```
Isso troca Linux, LINUX, linux... tudo.
### Substituir apenas em linhas específicas
Você pode indicar quais linhas serão modificadas.<br/>
* Substituir só na segunda linha:
```bash
    sed '2s/Linux/Ubuntu/' teste.txt
```
* Substituir da linha 1 até a 2:
```bash
    sed '1,2s/Linux/Ubuntu/' teste.txt
```
### Substituir várias palavras de uma vez
* Você pode encadear substituições com `;`
```bash
    sed -e 's/Linux/Ubuntu/g; s/poderoso/incrível/g' teste.txt
```
### Usar variáveis dentro do sed (em scripts)
```bash
    palavra="Linux"
    nova="Debian"
    sed -i "s/$palavra/$nova/g" teste.txt
```

## Resumo
| Modificador | Função                                  |
| ----------- | --------------------------------------- |
| `g`         | Substitui todas as ocorrências na linha |
| `i`         | Ignora maiúsculas/minúsculas            |
| `p`         | Imprime linhas que foram alteradas      |
| `-i`        | Altera o arquivo diretamente            |
| `-n`        | Suprime a saída padrão (usado com `p`)  |

