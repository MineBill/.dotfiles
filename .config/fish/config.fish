abbr -a g 'git'
abbr -a c 'cargo'
abbr -a dotfiles '/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

if command -v exa > /dev/null
	abbr -a l 'exa'
	abbr -a ls 'exa'
	abbr -a ll 'exa -l'
	abbr -a lll 'exa -la'
else
	abbr -a l 'ls'
	abbr -a ll 'ls -l'
	abbr -a lll 'ls -la'
end

# Pure
set -g pure_symbol_prompt "❱"