# Path to your oh-my-zsh installation.
export ZSH="/home/thallium/.oh-my-zsh"
export GOPATH="/home/thallium/go"
export GOBIN=$GOPATH/bin
export LANG=en_US.utf8
export CXXFLAGS="-std=c++1z -g -Wall -Wextra -Wconversion -Wshift-overflow=2 -fsanitize=address -fsanitize=undefined -fno-sanitize-recover=all"
export CFLAGS="-lm"
export CPLUS_INCLUDE_PATH="/home/thallium/acm"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#e5e9f0,bg:#2e3440,hl:#81a1c1
    --color=fg+:#e5e9f0,bg+:#2e3440,hl+:#81a1c1
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'
export FZF_CTRL_R_OPTS='--sort --exact'
export ASAN_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer
export LANG=en_US.UTF-8
export MANPAGER="nvim -u NORC -R -c 'set ft=man' -"

#######################################################
#                     NNN                             #
#######################################################
export NNN_FCOLORS='c1e20402006006f7c6d6ab01'
export NNN_PLUG='1:bookmarks;p:preview-tui;o:fzcd;j:autojump'
export NNN_FIFO=/tmp/nnn.fifo
export NNN_BMS='c:~/.config;q:~/qmk_firmware/keyboards/ut472/keymaps/thallium;t:.TIM.unionfs/drive_c/users/thallium/My Documents/Tencent Files/1060574237/FileRecv/'

#######################################################
#                   PATH                              #
#######################################################
typeset -U PATH path
path+=/usr/bin
path+=$GOPATH/bin
path+=$HOME/.gem/ruby/2.7.0/bin
path+=/home/thallium/.local/share/gem/ruby/2.7.0/bin
path+=/home/thallium/github/kotlin-language-server/server/build/install/server/bin
path+=/home/thallium/.local/bin
export PATH
