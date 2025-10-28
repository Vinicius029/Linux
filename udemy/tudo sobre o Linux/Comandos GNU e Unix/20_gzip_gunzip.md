# tar
O gzip (GNU zip) é um utilitário que compacta arquivos individuais usando o algoritmo DEFLATE (o mesmo do .zip).

Ele reduz o tamanho de arquivos de texto, logs, backups etc.

Extensão gerada: .gz

## Sintaxe básica
```bash
   gzip [opções] arquivo
```

## Exemplo de Uso

Comprimir um arquivo
```bash
   gzip arquivo.txt
```
* sso cria arquivo.txt.gz e remove o original por padrão.

## Manter o original ao comprimir
Use a opção -k (keep):
```bash
   gzip -k arquivo.log
```
## Comprimir múltiplos arquivos
Cada um vira um .gz separado:
```bash
   gzip arquivo1 arquivo2 arquivo3
```
* Para compactar uma pasta inteira, use o tar junto: `tar -czf pasta.tar.gz pasta/`
## Ver taxa de compressão
```bash
   gzip -v arquivo.txt
```
## Descompactar com gunzip
O comando gunzip é o inverso do gzip.
```bash
   gunzip arquivo.txt.gz
```
* Extrai e remove o .gz, restaurando o arquivo original
## Descompactar mantendo o .gz
Use a opção -k novamente:
```bash
   gunzip -k arquivo.txt.gz
```
## Visualizar conteúdo sem descompactar
Use a opção -k novamente:
```bash
   zcat arquivo.txt.gz
```
* Mostra o conteúdo direto no terminal (sem extrair o arquivo).

Outros utilitários similares:
* zgrep → buscar texto dentro de .gz
* zless → visualizar de forma paginada
* zmore → visualizar página por página

## Recompactar arquivos já comprimidos
Você pode recompactar com um nível de compressão diferente
```bash
   gzip -9 arquivo.txt 
```
| Nível | Opção      | Descrição                                |
| ----- | ---------- | ---------------------------------------- |
| 1     | `-1`       | Compressão mais rápida (menos eficiente) |
| 6     | *(padrão)* | Equilíbrio entre tempo e tamanho         |
| 9     | `-9`       | Compressão máxima (mais lenta)           |

## Comparação entre gzip e outros compressores
| Ferramenta | Extensão | Nível de compressão | Velocidade | Observação                  |
| ---------- | -------- | ------------------- | ---------- | --------------------------- |
| `gzip`     | `.gz`    | Boa                 | Rápida     | Equilíbrio                  |
| `bzip2`    | `.bz2`   | Melhor              | Mais lenta | Mais eficiente em textos    |
| `xz`       | `.xz`    | Excelente           | Mais lenta | Ideal para grandes arquivos |

# Resumo rápido
| Ação                        | Comando                    | Resultado             |
| --------------------------- | -------------------------- | --------------------- |
| Compactar arquivo           | `gzip arquivo.txt`         | Cria `arquivo.txt.gz` |
| Compactar e manter original | `gzip -k arquivo.txt`      | Mantém ambos          |
| Compactar vários            | `gzip arquivo1 arquivo2`   | Cria `.gz` para cada  |
| Descompactar                | `gunzip arquivo.txt.gz`    | Restaura o original   |
| Descompactar e manter `.gz` | `gunzip -k arquivo.txt.gz` | Mantém os dois        |
| Ver conteúdo sem extrair    | `zcat arquivo.txt.gz`      | Mostra no terminal    |
| Testar integridade          | `gzip -t arquivo.txt.gz`   | Verifica erros        |
| Comprimir com maior taxa    | `gzip -9 arquivo.txt`      | Compressão máxima     |
