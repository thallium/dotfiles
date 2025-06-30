if status is-interactive
	alias nv=nvim
	alias lg='lazygit'
	alias rg='rg -S'

	alias ls='ls --color=auto'
	alias lt='ls -lthr'
	alias ll='ls -lh'
	alias la='ls -lAh'

# Git
	alias ga='git add'
	alias gaa='git add --all'

	alias gss='git status -s'
	alias gst='git status'
	alias gsb='git status -sb'

	alias gp='git push'
	alias gpf='git push -f'

	alias gc='git commit -v'
	alias gcmsg='git commit -m'

	alias gd='git diff'

	alias glo='git log --oneline'

#tmux
	alias tm='tmux'
	alias ta='tmux a'
	alias tad='tmux a -d'
	alias tls='tmux list-sessions'
	alias tns='tmux new-session'

# Homebrew
	alias bse='brew search'
	alias bin='brew install'
	alias bup='brew upgrade'
end
