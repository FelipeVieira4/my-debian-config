# ==========================================
# ZSH CONFIGURATION & THEME
# ==========================================

# Se você utiliza o Oh My Zsh, defina o tema aqui:
# ==========================================
# ZSH CONFIGURATION & THEME
# ==========================================

# Se você utiliza Oh My Zsh:
export ZSH_THEME="alanpeabody"

# Se você NÃO usa Oh My Zsh (Stand-alone):
if [[ -z "$ZSH" ]]; then
  # Carrega o módulo de cores do Zsh
  autoload -Uz colors && colors
  
  # Habilita a expansão de comandos dentro do prompt (necessário para funções no prompt)
  setopt prompt_subst

  # Função leve para mostrar a branch do Git
  git_prompt_info() {
    local ref
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || return
    echo " (%{$fg[red]%}${ref#refs/heads/}%{$reset_color%})"
  }

  # Configuração do Prompt estilo alanpeabody
  PROMPT='%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}:%{$fg[green]%}%~%{$reset_color%}$(git_prompt_info) %{$fg[magenta]%}%#%{$reset_color%} '
fi

# ==========================================
# KEYBINDINGS & HISTORY
# ==========================================

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# ==========================================
# AUTOCOMPLETION SYSTEM
# ==========================================
# Use modern completion system
autoload -Uz compinit
compinit

# Ativa a navegação por menu com as setas
setopt MENU_COMPLETE

# CORREÇÃO: auto-description comentado para evitar poluição no cd
# zstyle ':completion:*' auto-description 'specify: %d'

zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''

# Configura o menu interativo para aceitar setas, PageUp/PageDown, etc.
zstyle ':completion:*' menu select=1

# Cores para listagem e completion
eval "$(dircolors -b 2>/dev/null || true)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

# Estilo para listagem de processos ao usar 'kill'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
