# Colorize grep output
alias grep="grep --color=auto"

# List open ports
alias ports="lsof -i -P | grep -i listen"

# Colorize ls output
if [ $(uname) == Darwin ]; then
	export CLICOLOR=true
else
	alias ls="ls --color=auto"
fi

# Do not warn about zsh
if [ $(uname) == Darwin ]; then
	export BASH_SILENCE_DEPRECATION_WARNING=1
fi

# Set java home
if [ $(uname) == Darwin ]; then
	export JAVA_HOME=$(/usr/libexec/java_home)
fi

# Remove dups from history
export HISTCONTROL=erasedups

# Increase history size
export HISTSIZE=250000

# Set vim as default editor
export EDITOR=vim

# Append history on exit
shopt -s histappend

# Add perl5/bin to PATH
if [ -d $HOME/perl5/bin ]; then
	export PATH=$PATH:$HOME/perl5/bin
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

# Homebrew
if [ -d $HOME/homebrew ]; then
	export PATH=$PATH:$HOME/homebrew/bin
fi

# NPM
if [ -d $HOME/node_modules/.bin ]; then
	export PATH=$PATH:$HOME/node_modules/.bin
fi

# Yarn
if [ -d $HOME/.yarn/bin ]; then
	export PATH=$PATH:$HOME/.yarn/bin
fi

# Ruby env
if which rbenv &> /dev/null; then
	eval "$(rbenv init -)"
fi

# Random binaries
if [ -d $HOME/.bin ]; then
	export PATH=$HOME/.bin:$PATH
fi

# Torsocks configuration file
if [ -f $HOME/.torsocks.conf ]; then
	export TORSOCKS_CONF_FILE=$HOME/.torsocks.conf
fi

# Source local bashrc
if [ -f $HOME/.bashrc.local ]; then
	source $HOME/.bashrc.local
fi
