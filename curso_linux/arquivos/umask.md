# Comando `umask` no Linux

## O que é?

O `umask` define as **permissões padrão** para novos arquivos e diretórios criados no sistema.

⚠️ Importante:
O `umask` **remove permissões**, ele não adiciona.

---

# Conceito Fundamental

Quando criamos novos arquivos e diretórios, o sistema parte de uma permissão base:

- 📄 Arquivos começam com: `666` (rw-rw-rw-)
- 📁 Diretórios começam com: `777` (rwxrwxrwx)

O `umask` subtrai permissões dessa base.

---

# 🔎 Ver o valor atual

```bash
umask
```

## Como funciona

umask = 022

arquivos = 666

Subtraindo 666-022 = 644 = rw-r--r--

diretórios = 777

Subtraindo 777-022 = 755 - rwx-xr-x

## Alterar o umask (temporário)
```bash
    umask 077

    # Novos arquivos terão
    600 rw-------
    700 rwx------
```
- Vale apenas para a sessão atual.

## Tornar permanente
Editar:
```bash
    ~/.bashrc (usuário)
    /etc/profile (global)
    source ~/.bashrc
```

## Regras Importantes
- umask afeta apenas arquivos novos
- Não altera arquivos já existentes
- Arquivos começam em 666
- Diretórios começam em 777
- Ele remove permissões


