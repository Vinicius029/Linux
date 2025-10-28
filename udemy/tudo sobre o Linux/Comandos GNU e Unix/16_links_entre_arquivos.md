# `ln`

O comando ln (de link) serve para criar um atalho ou referência de um arquivo ou diretório.

No Linux, há dois tipos de links:
* Link físico (hard link)
* Link simbólico (soft link ou symlink)

## Hard Link (link físico)
Um hard link é como se você tivesse dois nomes diferentes para o mesmo arquivo.
* O link e o arquivo original compartilham os mesmos dados no disco.
Se você editar um, o outro também muda, pois apontam para o mesmo conteúdo.
* Se apagar o arquivo original, o link continua funcionando, pois os dados ainda existem.
* Só funciona dentro do mesmo sistema de arquivos (mesmo disco/partição).

Exemplo:
```bash
    ln texte.txt /tmp/link_fisico.txt
```
texte.txt e link_fisico.txt são o mesmo arquivo “fisicamente”.
Se você rodar ls -li, verá o mesmo inode (número de identificação do arquivo).

## Soft Link (link simbólico)
Um soft link (ou symlink) é como um atalho do Windows — ele apenas aponta para o caminho de outro arquivo.

* Aponta para o caminho do arquivo, não para o conteúdo.
* Se apagar o arquivo original, o link quebra (fica “pendurado”).
* Pode apontar para arquivos ou diretórios, mesmo em partições diferentes.
* É criado com a opção -s.

```bash
    ln -s /etc/passwd link_simbolico.txt
```
link_simbolico.txt é apenas um atalho para /etc/passwd