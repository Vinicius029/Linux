# Comandos Básicos do Terminal Linux

## 📁 Gerenciamento de Arquivos e Diretórios

- `ls`  
  Lista diretórios e arquivos.

- `man ls`  
  Exibe o manual do comando `ls`.

- `ls --help`  
  Exibe a ajuda do comando `ls`.

- `clear`  
  Limpa o terminal.

- `mkdir nome-da-pasta`  
  Cria uma nova pasta no diretório atual.

- `mkdir "pasta1 pasta2"`  
  Cria uma pasta com espaço no nome.

- `cd nome-da-pasta`  
  Entra na pasta especificada.

- `cd pasta1\ pasta2`  
  Entra em uma pasta com espaço no nome (usando `\` para escapar o espaço).

- `pwd`  
  Mostra o caminho (path) atual.

- `touch test1.txt`  
  Cria um novo arquivo.

- `nano test1.txt`  
  Abre o editor de texto `nano` no terminal.

- `cat test1.txt`  
  Mostra o conteúdo do arquivo no terminal.

- `mv test1.txt curso_de_terminal.txt`  
  Renomeia o arquivo.

- `cp curso_de_terminal.txt /home/vinicius/Documentos/linux`  
  Copia o arquivo para outro diretório.

- `rm test1.txt`  
  Remove (apaga) um arquivo.

- `rmdir nome-da-pasta`  
  Remove uma pasta vazia.

- `rm -rf nome-da-pasta/`  
  Remove uma pasta com todos os seus conteúdos (**CUIDADO**).

## 🔎 Busca de Arquivos

- `find . -name curso_de_terminal.txt`  
  Encontra o arquivo a partir do diretório atual.

- `find . -name "*.md*"`  
  Procura arquivos com extensão `.md` a partir do diretório atual.

## 📄 Redirecionamento e Histórico

- `whoami >> test.txt`  
  Redireciona a saída do comando `whoami` para o arquivo `test.txt` (cria se não existir).

- `history`  
  Mostra o histórico de comandos executados no terminal.

## 📑 Leitura de Arquivos de Log

- `tail kern.log`  
  Mostra as últimas linhas do arquivo `kern.log`.

- `less kern.log`  
  Permite a leitura paginada do arquivo `kern.log`.

## 🧠 Informações do Sistema

- `hostname`  
  Mostra o nome da máquina (hostname).

- `hostname -I`  
  Mostra todos os IPs da máquina.

- `ip a | grep inet`  
  Exibe os endereços IP, filtrando com `grep`.

- `free -h`  
  Mostra o uso da memória (em formato legível).

- `htop`  
  Visualiza os processos ativos e o uso de recursos (CPU, memória).

- `lscpu`  
  Exibe informações detalhadas da CPU.

- `lspci | grep USB`  
  Mostra informações relacionadas às portas USB.

## 🖥️ Gerenciamento de Processos

- `ps aux | grep gnome-terminal`  
  Mostra e filtra processos com o nome `gnome-terminal`.

- `pgrep gnome-terminal`  
  Mostra os PIDs do processo `gnome-terminal`.

- `ncdu`  
  Analisa o uso de disco das pastas, exibindo quanto espaço cada uma consome.
