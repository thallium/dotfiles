# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"



plugins=(git extract zsh-autosuggestions zsh-syntax-highlighting autojump archlinux zsh-vi-mode)
source $ZSH/oh-my-zsh.sh

##################################################
#                 aliase                         #
##################################################
alias gvim="gvim -p"
alias -s {cpp,c}=nvim
alias -g nv=nvim
alias nnn="nnn -e"
alias rng=ranger
alias his="history|fzf --tac"
alias ssh="kitty +kitten ssh"
alias za="zathura"
alias wd="sdcv"
# alias sudo="doas"

autoload -U compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin
[[ -s /home/thallium/.autojump/etc/profile.d/autojump.sh ]] && source /home/thallium/.autojump/etc/profile.d/autojump.sh
# eval "$(bw completion --shell zsh); compdef _bw bw;" # bitwarden auto completion

#""""""""""""""""""""functions"""""""""""""""""""#
ex () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

unalias l
function l () {
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

cd_with_fzf() {
    cd $(fd -t d --search-path ~ -L -d 7 | fzf --preview="tree -L 1 {}" --bind=";:toggle-preview");
    zle accept-line
    zle reset-prompt;
}

zle -N cd_with_fzf
bindkey -M viins '^G' cd_with_fzf

make_post() {
    nvim $(date +%Y-%m-%d)-$1.md
}

d() {
    cd $(dirs | awk 'gsub("~", "/home/thallium") gsub(" ", "\n")' | fzf --height 10%)
    # zle fzf-redraw-prompt
}

bindkey -M viins '^O' forward-word

# eval "$(starship init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/.powerlevel10k/powerlevel10k.zsh-theme
