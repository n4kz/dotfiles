#!/bin/bash
# Script to download vim files from github and push'em into .dotfiles/vim directory

cd $(dirname $0);
sources=$(cat sources.list)

cd ..

if ! [ -d vim ]; then
	mkdir vim
fi

cd vim

for url in $sources; do
	folder=$(echo $url | sed -e 's/.*\///')-master

	wget -O master.zip $url/archive/master.zip

	unzip -o master.zip
	cp -rv $folder/* ./
	rm -rfv $folder master.zip README* Make* *.md
done
