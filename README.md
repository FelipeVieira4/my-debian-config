# 🛠️ Configurações do Sistema

Repositório pessoal contendo os arquivos de configuração do meu ambiente de desenvolvimento no Linux (Debian), incluindo **Emacs**, **Alacritty** e **Zsh**.

---

## ⚙️ Componentes & Detalhes

### 1. 🦬 Emacs (`emacs/init.el`)
Configuração leve focada em desenvolvimento **C / C++** e produtividade:
* **Tema:** `ahungry-theme` (gerenciado automaticamente pelo MELPA/ELPA).
* **LSP & Autocompletar:** Integrado com `clangd` via `Eglot` (LSP nativo) e `Company Mode`.
* **Navegação de Código:** Atalho `F12` para ir até a definição (`xref-find-definitions`) e `Shift + F12` para voltar.
* **Snippets:** Suporte ativo com `Yasnippet`.
* **Interface:** Fonte tamanho 14pt e **números de linha relativos** ativados.
* **Organização:** Redirecionamento automático de backups (`~/.emacs.d/backups/`) e auto-saves (`~/.emacs.d/auto-save/`), mantendo os repositórios de projetos sempre limpos.

### 2. ⚡ Alacritty (`.config/alacritty/alacritty.toml`)
Terminal rápido acelerado por GPU:
* Fonte monoespaçada configurada para casar com a do editor.
* Suporte total a cores TrueColor (24-bit).

### 3. 🐚 Zsh (`.zshrc`)
Configuração do shell para terminal:
* Aliases para produtividade diária e navegação.
* Integração com histórico e autocompletar.
