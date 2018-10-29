# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/mariano/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000

bindkey "^?" backward-delete-char
bindkey "^h" backward-delete-char
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search
bindkey "^w" backward-kill-word
bindkey "^u" backward-kill-line

unsetopt beep
setopt extendedglob
setopt nocaseglob
setopt numericglobsort
setopt appendhistory
setopt histignorespace
setopt histignoredups
setopt histignorealldups
setopt histreduceblanks
setopt extendedhistory
setopt histsavenodups
setopt histexpiredupsfirst
setopt histfindnodups
setopt interactivecomments

DIRSTACKSIZE=10
setopt autopushd pushdminus pushdsilent pushdtohome
alias dhi=" dirs -v"

alias ga=" git add"
alias gb=" git branch"
alias gpr=" git pull --rebase"
alias gc="git commit"
alias gco="git checkout"
alias g-="git checkout -"
alias gd=" git diff"
alias gdc=" git diff --cached"
alias gs=" git status --short"
alias gi=" git show"
alias gl="git log --oneline"
alias gll='git log --oneline --pretty="format:%C(auto,yellow)%h%C(auto,reset) %cn %C(auto,yellow)%cr%C(auto,reset)%C(auto,green)%d%C(auto,reset) %s"'

alias ls=" ls -h"
alias l=" ls -l"
alias s=ssh
alias v=vim

alias pm="python unhaggle/manage.py"
alias pmrs="pm runserver"
alias pmmm="pm makemigrations"

# Prompt
autoload -U colors
colors
setopt prompt_subst
ZLE_RPROMPT_INDENT=0

function zle-keymap-select zle-line-init {
    zle reset-prompt
    zle -R
}

function TRAPINT() {
    zle && zle reset-prompt
    return $(( 128 + $1 ))
}

zle -N zle-keymap-select
zle -N zle-line-init
bindkey -v

vi_ins_mode="%{$fg[green]%}«%{$reset_color%}"
vi_cmd_mode="%{$fg[yellow]%}«%{$reset_color%}"
function vi_mode_prompt() {
    echo "${${KEYMAP/vicmd/$vi_cmd_mode}/(main|viins)/$vi_ins_mode}"
}

function path_prompt() {
    local working_dir="%2~"
    echo "$working_dir"
}

RPROMPT='$(vi_mode_prompt) $(path_prompt)'
PROMPT="%% "


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
