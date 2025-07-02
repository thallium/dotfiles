if status is-interactive
	switch (uname)
		case Darwin
			if test -x /opt/homebrew/bin/brew
				eval "$(/opt/homebrew/bin/brew shellenv)"
			end
		case Linux
			if test -x /home/linuxbrew/.linuxbrew/bin/brew
				eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
			end
	end

	fish_add_path ~/go/bin
	fish_add_path '/Applications/Visual Studio Code.app/Contents/Resources/app/bin'

	zoxide init fish | source
	starship init fish | source
end
