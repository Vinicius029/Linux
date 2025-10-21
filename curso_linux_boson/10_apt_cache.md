# Comando `apt-cache`

O `apt-cache` é um comando utilizado para manipular e obter informações sobre os pacotes no cache do apt.

## Alguns comandos:

* Mostrar pacotes em cache, com paginação
```bash
    sudo apt-cache pkgnames | less
```
* Filtrar um pacote, por uma palavra chave
```bash
    sudo apt-cache pkgnames | grep node
```

## Alguns exemplos:

- **`apt-cache pkgnames`**  
  Mostra os nomes de todos os pacotes no cache.

- **`apt-cache stats`**  
  Mostra algumas estatísticas básicas.

- **`apt-cache dump`**  
  Mostra um despejo do cache inteiro.

- **`apt-cache search`**  
  Mostra todos os pacotes relacionados com a palavra-chave

- **`apt-cache show`**  
  Mostra uma breve descrição sobre um pacote em particular.

- **`apt-cache showpkg`**  
  Mostra uma informação mais geral sobre o pacote.

- **`apt-cache depends`**  
  Mostra de quais pacotes o pacote especificado depende.








