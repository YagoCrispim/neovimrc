#!/bin/bash

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

npm i -g yarn
npm i -g neovim

touch sessions

# py dependencies
pip3 install jedi
pip3 install autopep8
pip3 install --user --upgrade pynvim

# ferret dependencies
sudo apt-get install ripgrep

# c/c++ lsp
sudo apt install ccls

