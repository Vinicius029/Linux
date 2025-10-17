# Comando `apt`

O arquivo /etc/apt/sources.list

Para funcionar, o APT usa um arquivo que lista as 'fontes' de onde ele obterá os pacotes. Esse arquivo é o /etc/apt/sources.list.

As entradas desse arquivo são normalmente formadas assim:

deb http://host/debian distribuição seção1 seção2 seção3  
deb-src http://host/debian distribuição seção1 seção2 seção3


A primeira palavra das linhas, deb e deb-src indicam o tipo de repositório: se guarda pacotes binários (deb), ou seja, os pré-compilados que normalmente usamos ou se guarda pacotes fonte (deb-src), que são o fonte original do programa.

Sempre que esse arquivo for modificado, deve-se rodar o comando apt-get update. Isso deve ser feito para que o APT obtenha as listas de pacotes das fontes que foram especificadas.

* Para instalar um pacote
```bash
    sudo apt install tree
```

* Para remover um pacote
```bash
    sudo apt remove tree
```

# APT-GET – Opções

- **`apt-get clean`**  
  Apaga todos os pacotes baixados e já instalados.

- **`apt-get autoclean`**  
  Apaga todos os pacotes que não possam mais ser baixados.

- **`apt-get autoremove`**  
  Remove pacotes órfãos (sem utilidade, dependências de softwares já removidos).

- **`apt-get -d`**  
  Baixa arquivos apenas, sem instalar.

- **`apt-cache dump`**  
  Lista todos os pacotes instalados.

- **`apt-cache stats`**  
  Mostra informações como o número de pacotes instalados e de dependências.

- **`apt-get f install`**  
  Verifica lista de dependências quebradas e tenta corrigi-las instalando pacotes necessários.

- **`apt-get upgrade`**  
  Atualiza os pacotes do sistema. Use a opção para ver os pacotes que serão atualizados.








