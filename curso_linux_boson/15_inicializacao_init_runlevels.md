# Inicialização

- Ao se iniciar o Linux, são usados diversos scripts presentes no diretório `/etc` para configurar o sistema e mudar e um nível de execução a outro.

- Esse processo varia um pouco entre as distribuições.

# Processo init

- Init - Inicialização do controle de processos. é o pai de todos os processos, criado a partir de um script armazenado em /etc/inittab.

- PID: 1

# RunLevels - Níveis de Execução

- O conceito de Níveis de Execução especifica as diferentes formas pelas quais um sistema pode ser utilizado e o controle sobre quais serviços rodarão.

- Os níveis de execução são especificados pelos números inteiros de 0 a 6.

- O processo init é responsável por levar o sistema nível de execução padrão.

* Para acessar init.d
```bash
    cd /etc/init.d
```
* Todos os runlevels
```bash
    ls rc* | less
```

## Runlevels:

* 0 - Sistema Desligado
* 1, S, s - Modo Monousuário
* 2 - Multiusuário; Padrão no Debian
* 3 - Multiusuário. Padrão no Red Hat, sem GUI
* 4 - Não Usuado
* 5 - Multiusuário completo com login gráfico (Red Hat)
* 6 - Reinicialização do Sistema


## Telinit:

Comando `telinit` para mudar o runlevel em tempo de execução.

* Desligar o sistema:
```bash
    telinit 0 
```

