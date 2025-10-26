# Comando tee no Linux (lê e grava ao mesmo tempo)

O tee lê a entrada padrão (stdin) e envia a saída (stdout) para dois lugares ao mesmo tempo:
* Para a tela (como de costume)
* Para um arquivo
Ou seja: ele “divide o fluxo” — por isso o nome tee vem do formato da letra T (uma ramificação).

## Comando:

- Mostra a lista de arquivos na tela, e salva o mesmo resultado em lista.txt
```bash
    ls | tee lista.txt
```
Sem o tee, se você usasse ls > lista.txt, o conteúdo não apareceria na tela — apenas seria salvo.

### Combinando com pipes
- O tee é muito útil no meio de pipelines, para salvar resultados parciais de um comando.
```bash
    cat /var/log/syslog | grep error | tee erros.txt | wc -l
```
* cat /var/log/syslog → lê o log
* grep error → filtra linhas com “error”
* tee erros.txt → salva essas linhas no arquivo e passa adiante
* wc -l → conta quantas linhas foram encontradas


Resumo final:
tee é usado para visualizar e salvar a saída ao mesmo tempo.
Muito útil em scripts, logs e depuração.
Pode ser usado com -a para não sobrescrever arquivos.