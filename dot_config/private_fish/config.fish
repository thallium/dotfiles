if status is-interactive
	eval "$(/opt/homebrew/bin/brew shellenv)"

	fish_add_path ~/go/bin
	fish_add_path '/Applications/Visual Studio Code.app/Contents/Resources/app/bin'

	zoxide init fish | source
	starship init fish | source
end
