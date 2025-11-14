# Explicando detalhadamente 

## Entendendo `sites-available` e `sites-enabled`
O Nginx usa uma estrutura de diretórios para organizar e gerenciar múltiplos sites em um mesmo servidor. Isso é chamado de Virtual Hosts (hosts virtuais).
Imagine que você tem um servidor e quer hospedar 3 sites diferentes:
* site1.com
* site2.com
* blog.com

#### O Nginx precisa de uma forma de:** <br/>

* Armazenar todas as configurações desses sites
* Ativar/desativar sites sem apagar suas configurações
* Organizar tudo de forma clara

**`/etc/nginx/sites-available/`**
O que é: Diretório onde ficam TODAS as configurações de sites disponíveis.<br/>
Analogia: É como uma "biblioteca" ou "arquivo morto" onde você guarda todas as configurações de sites que você tem, mesmo que não estejam ativos.<br/>

Características:
* Os arquivos aqui NÃO estão ativos
* É um local seguro para guardar configurações
* Você pode editar sem afetar o servidor
* Pode ter dezenas de arquivos aqui

**`/etc/nginx/sites-enabled/`**
O que é: Diretório onde ficam APENAS os sites que estão ativos/habilitados.<br/>
Analogia: É como uma "mesa de trabalho" onde ficam apenas os sites que o Nginx deve processar neste momento.

Características:
* Os arquivos aqui SÃO LINKS SIMBÓLICOS (atalhos)
* Apenas sites aqui são carregados pelo Nginx
* Geralmente tem poucos arquivos
* O Nginx lê apenas este diretório ao iniciar

## Comando Úteis
#### Listar todos os sites disponíveis
ls /etc/nginx/sites-available/

#### Listar todos os sites ativos
ls /etc/nginx/sites-enabled/

#### Ver para onde um link aponta
readlink -f /etc/nginx/sites-enabled/meusite

#### Verificar se é um link simbólico
file /etc/nginx/sites-enabled/meusite

#### Remover site padrão do Nginx
sudo rm /etc/nginx/sites-enabled/default