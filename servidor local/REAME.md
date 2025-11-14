# Servidor local com NGINX

## Configurando um Servidor Web Local no Ubuntu

### Índices
* 1 Preparação do ambiente
* 2 Instalação do servidor web (Nginx)
* 3 Configuração de firewall (UFW)
* 4 Instalação do banco de dados (MySQL/MariaDB)
* 5 Instalação do PHP
* 6 Configuração de um site de teste
* 7 Criação de scripts de monitoramento
<hr>

## 1 PREPARAÇÃO DO AMBIENTE
Atualizar o sistema. Isso é sempre o primeiro passo em qualquer servidor:
```bash
    sudo apt update
    sudo apt upgrade -y
```
## 2 INSTALAÇÃO DO SERVIDOR WEB (NGINX)
Instala o servidor web Nginx (pronuncia-se "engine-x"), um dos servidores web mais usados em DevOps:
```bash
    sudo apt install nginx -y
```
Mostra a versão do Nginx instalada:
```bash
    nginx -v
```
Verificar o status do serviço:
```bash
    sudo systemctl status nginx
```
**Comandos úteis do Nginx:**
### Parar o servidor
`sudo systemctl stop nginx`

### Iniciar o servidor
`sudo systemctl start nginx`

### Reiniciar o servidor
`sudo systemctl restart nginx`

### Recarregar configurações (sem derrubar conexões)
`sudo systemctl reload nginx`

### Habilitar inicialização automática no boot
`sudo systemctl enable nginx`
<hr>

## 3 CONFIGURAÇÃO DO FIREWALL (UFW)
O UFW (Uncomplicated Firewall) é o firewall padrão do Ubuntu.<br/>
Verificar status:
```bash
    sudo ufw status
```
Permite conexões na porta 22 (SSH) usando protocolo TCP.
```bash
    sudo ufw allow 22/tcp
```
Permitir HTTP (porta 80):
```bash
    sudo ufw allow 80/tcp
```
Permitir HTTPS (porta 443):
```bash
    sudo ufw allow 443/tcp
```
Ver as aplicações disponíveis no UFW:
```bash
    sudo ufw app list
```
Permitir Nginx completo (HTTP + HTTPS):
```bash
    sudo ufw allow 'Nginx Full'
```
Ativar o firewall:
```bash
    sudo ufw enable
```
Verificar regras ativas:
```bash
    sudo ufw status verbose
```
<hr>

## 4 INSTALAÇÃO DO PHP
Instalar PHP e módulos essenciais:
```bash
    sudo apt install php-fpm php-mysql php-cli php-curl php-gd php-mbstring php-xml php-zip -y
```
* `php-fpm` = FastCGI Process Manager (para Nginx processar PHP)
* `php-mysql` = conexão com MySQL
* `php-cli` = PHP via linha de comando
* `php-curl` = requisições HTTP
* `php-gd` = manipulação de imagens
* `php-mbstring` = strings multibyte (caracteres especiais)
* `php-xml` = processamento XML
* `php-zip` = manipulação de arquivos ZIP

Verificar a versão do php:
```bash
    php -v
```
Verificar se o PHP-FPM está rodando:
```bash
    sudo systemctl status php*-fpm
```
<hr>

## 5 CONFIGURAÇÃO DE UM SITE DE TESTE
Criar diretório para o site:
```bash
    sudo mkdir -p /var/www/meusite
```
* `-p` = cria diretórios pais se não existirem
* `/var/www/` = local padrão para sites no Linux

Definir permissões:
```bash
    sudo chown -R $USER:$USER /var/www/meusite
```
* `chown` = change owner (mudar dono)
* `-R` = recursivo (aplica a todos os arquivos dentro)
* `$USER` = seu usuário atual
```bash
    sudo chmod -R 755 /var/www/meusite
```
Criar arquivo de teste e adiciona informação:
```bash
    nano /var/www/meusite/index.php

    <?php
        echo "<h1>Aprendendo administrar um servidor Linux!🐧</h1>";
    ?>
```

### Configurar o Nginx para o site:
Criar arquivo de configuração:
```bash
    sudo nano /etc/nginx/sites-available/meusite
```
Cole esta configuração:
```bash
    server {
        listen 80;
        listen [::]:80;
        
        root /var/www/meusite;
        index index.php index.html index.htm;
        
        server_name meusite.local;
        
        location / {
            try_files $uri $uri/ =404;
        }
        
        location ~ \.php$ {
            include snippets/fastcgi-php.conf;
            fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
        }
        
        location ~ /\.ht {
            deny all;
        }
    }
```
* `listenl 80` = escuta na porta 80 (HTTP)
* `root` = diretório raiz do site
* `index` = arquivos padrão de índice
* `server_name` = domínio do site
* `location /` = como tratar requisições na raiz
* `location ~ \.php$` = como processar arquivos PHP
* `location ~ /\.ht` = bloqueia acesso a arquivos .htaccess

Ativar o site:<br/>
Cria um link simbólico (atalho) do arquivo de configuração
```bash
    sudo ln -s /etc/nginx/sites-available/meusite /etc/nginx/sites-enabled/
```
Testar configuração do Nginx:
```bash
    sudo nginx -t
```
* Deve retornar "syntax is ok" e "test is successful".
Recarregar o Nginx:
```bash
    sudo systemctl reload nginx
```
Adicionar entrada no hosts:
```bash
    sudo nano /etc/hosts

    # Adicione esta linha:
    127.0.0.1   meusite.local
```
### Agora acesse no navegador: http://meusite.local

## 6 SCRIPT DE MONITORAMENTO BÁSICO
Criar um script simples para monitorar o servidor:
```bash
    mkdir ~/scripts
    nano ~/scripts/monitor.sh
```
Cole este conteúdo:
```bash
    #!/bin/bash

    # Script de monitoramento básico
    # Data: $(date +%Y-%m-%d)

    echo "=== MONITORAMENTO DO SERVIDOR ==="
    echo "Data/Hora: $(date '+%Y-%m-%d %H:%M:%S')"
    echo ""

    # Verificar serviços
    echo "--- STATUS DOS SERVIÇOS ---"
    echo -n "Nginx: "
    systemctl is-active nginx

    echo -n "MySQL: "
    systemctl is-active mysql

    echo -n "PHP-FPM: "
    systemctl is-active php*-fpm
    echo ""

    # Uso de disco
    echo "--- USO DE DISCO ---"
    df -h / | tail -1
    echo ""

    # Uso de memória
    echo "--- USO DE MEMÓRIA ---"
    free -h | grep Mem
    echo ""

    # Processos mais pesados
    echo "--- TOP 5 PROCESSOS (CPU) ---"
    ps aux --sort=-%cpu | head -6
```
Tornar executável:
```bash
    chmod +x ~/scripts/monitor.sh
```
Executar:
```bash
    ~/scripts/monitor.sh
```