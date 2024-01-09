# Misc
alias -s {cpp,c}=nvim
alias -g nv=nvim

# commands
alias nnn="nnn -e"
alias qmk="/opt/homebrew/bin/qmk"
alias cla="/opt/homebrew/opt/llvm/bin/clang++"
alias waifu2x='~/github/waifu2x-ncnn-vulkan/waifu2x-ncnn-vulkan'
alias cp_main='cat ~/acm/rust/main/src/main.rs | pbcopy'
alias lg='lazygit'
alias rg='rg -S'
alias bat="bat --style=plain --theme=\$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo Enki-Tokyo-Night || echo OneHalfLight)"

# ls
alias ls='ls --color=auto'
alias lt='ls -lthr'
alias ll='ls -lh'
alias la='ls -lAh'

# navigation
alias -g ...=../..
alias -g ....=../../..

if type zoxide >> /dev/null; then
alias cd=z
fi
alias cdt='cd ./*(/om[1])' # cd to most recently modified child directory

# Git
alias ga='git add'
alias gaa='git add --all'

alias gss='git status -s'
alias gst='git status'
alias gsb='git status -sb'

alias gp='git push'

alias gc='git commit -v'
alias gcmsg='git commit -m'

alias gd='git diff'

alias glo='git log --oneline'

# Pacman
alias pacin='sudo pacman -S'
alias pacre='sudo pacman -R'

# Paru
alias paruin='paru -S'

# tmux
alias tm='tmux'
alias ta='tmux a'
alias tad='tmux a -d'
alias tls='tmux list-sessions'
alias tns='tmux new-session'

# Homebrew
alias bse='brew search'
alias bin='brew install'
alias bup='brew upgrade'
