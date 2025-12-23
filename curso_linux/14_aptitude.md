# Aptitude

O aptitude é um gerenciador de pacotes avançado para sistemas baseados em Debian/Ubuntu.
Ele funciona sobre o mesmo sistema de pacotes que o apt e apt-get, mas oferece:

- uma interface de texto interativa (modo visual no terminal),

- resolução automática de dependências mais inteligente,

- e opções de gerenciamento mais detalhadas.

O aptitude faz tudo o que o apt faz — e mais — só que com uma abordagem mais interativa e "inteligente".

## ⚙️ Comandos

* Instalação
```bash
   sudo apt install aptitude
```

* Modo interativo (tela visual no terminal)
```bash
  sudo aptitude
```
* Atualizar lista de pacotes
```bash
  sudo aptitude update
```
* Atualizar pacotes
```bash
  sudo aptitude upgrade
```
* Instalar um pacotes
```bash
  sudo aptitude install nginx
```
* Remover um pacote
```bash
  sudo aptitude remove nginx
```
* Procurar pacotes
```bash
  sudo aptitude search atari
```

## Dica prática

- Use apt no dia a dia (instalar, atualizar, remover).

- Use aptitude quando tiver problemas de dependências ou quiser explorar pacotes visualmente.

- Use apt-get em scripts automáticos (por ser mais previsível e estável).

