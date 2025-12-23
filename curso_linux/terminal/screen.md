# screen 
É um terminal multiplexer, ou seja, ele cria sessões independentes dentro do seu terminal.
- Criar múltiplas sessões
- Rodar processos que continuam funcionando mesmo se a conexão cair
- Sair da sessão e voltar nela depois

## Comandos
Cria uma nova sessão com nome
```bash
    screen -S terminal02
```
Sair da sessão sem matar o processo (detach).<br/>
Isso não encerra o que está rodando dentro do screen.
```bash
    Ctrl + A, depois D
```
Lista as sessões
```bash
    screen -ls
```
Voltar numa sessão existente
```bash
    screen -r
```
Voltar numa sessão especifica
```bash
    screen -r nome/id
```
Fechar uma sessão
```bash
    exit

    screen -X -S nome_ou_id kill
```

## Quando Usar

Evitar perder processos quando a conexão SSH cai
- backup
- update grande
- script que demora horas
- mineração de logs
- instalação de pacotes

Rodar tarefas de longa duração
- apt upgrade em servidor
- backup de 50 GB
- script Python que processa arquivos
- importação de banco de dados
- conversão de vídeos

Trabalhar em vários terminais dentro de um só
- janela 1: logs
- janela 2: editor nano
- janela 3: tail -f de um serviço