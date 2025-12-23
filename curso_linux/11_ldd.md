# 📘 Comando `ldd` no Linux — Guia Prático

## 🧩 O que é o `ldd`?

O comando **`ldd`** (List Dynamic Dependencies) é usado para **mostrar as bibliotecas dinâmicas** que um programa ou executável utiliza.

Em outras palavras:
> Ele mostra **quais arquivos `.so` (Shared Objects)** — ou seja, bibliotecas compartilhadas — são carregados quando você executa um programa.

---

## ⚙️ Sintaxe básica

```bash
   ldd /bin/ls
```

É muito útil para:

Verificar dependências de um executável antes de rodá-lo.

Detectar erros de bibliotecas faltando, como “error while loading shared libraries”.

Depuração (debug) em sistemas Linux.

Aprender como o sistema carrega programas.

