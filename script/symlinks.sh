#!/bin/bash

if [ $# -eq 0 ]
then
	echo "Usage: $0 [file ...]"
	exit 1
fi

for file in $@
do
	ln -v -s $HOME/.dotfiles/$file $HOME/.$file
done
