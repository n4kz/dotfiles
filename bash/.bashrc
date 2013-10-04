# Colorize grep output
alias grep="grep --color=auto"

# Enable colors
export CLICOLOR=true

# Add node_modules/.bin to PATH
if [ -d $HOME/node_modules/.bin ]; then
	export PATH="$HOME/node_modules/.bin:$PATH"
fi

# Add perl5/bin to PATH
if [ -d $HOME/perl5/bin ]; then
	export PATH="$HOME/perl5/bin:$PATH"
fi

# Source local bashrc
if [ -f $HOME/.bashrc.local ]; then
	source $HOME/.bashrc.local
fi
