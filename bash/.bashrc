# Colorize grep output
alias grep="grep --color=auto"

# List open ports
alias ports="lsof -i -P | grep -i listen"

# Enable colors
export CLICOLOR=true

# Remove dups from history
export HISTCONTROL=erasedups

# Increase history size
export HISTSIZE=20000

# Set vim as default editor
export EDITOR=vim

# Append history on exit
shopt -s histappend

# Add node_modules/.bin to PATH
if [ -d $HOME/node_modules/.bin ]; then
	export PATH=$HOME/node_modules/.bin:$PATH
fi

# Add perl5/bin to PATH
if [ -d $HOME/perl5/bin ]; then
	export PATH=$HOME/perl5/bin:$PATH
fi

# Add perl-specific variables to PATH
if [ -d $HOME/perl5 ]; then
	export PERL5LIB=$HOME/perl5/lib/perl5:$PERL5LIB
	export PERL_LOCAL_LIB_ROOT=$HOME/perl5:$PERL_LOCAL_LIB_ROOT
	export PERL_MB_OPT="--install_base \"$HOME/perl5\""
	export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"
fi

# Android SDK
if [ -d $HOME/Library/Android/sdk ]; then
	export ANDROID_HOME=$HOME/Library/Android/sdk
	export PATH=$PATH:$ANDROID_HOME/tools
	export PATH=$PATH:$ANDROID_HOME/platform-tools
fi

# Ruby env
if which rbenv &> /dev/null; then
	eval "$(rbenv init -)"
fi

# Random binaries
if [ -d $HOME/.bin ]; then
	export PATH=$HOME/.bin:$PATH
fi

# Source local bashrc
if [ -f $HOME/.bashrc.local ]; then
	source $HOME/.bashrc.local
fi
