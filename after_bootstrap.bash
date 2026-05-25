#!/usr/bin/env bash

# Install vim-plug plugin manager
if [ ! -f ~/.vim/autoload/plug.vim ]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install vim plugins
vim +'PlugInstall --sync' +'qa!' 2>/dev/null

terraform -install-autocomplete 2>/dev/null || true