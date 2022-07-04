#!/bin/bash

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

npm i -g yarn
npm i -g neovim

mkdir ~/.config/nvim

cp init.vim ~/.config/nvim/
touch ~/.config/nvim/sessions

# py dependencies
pip3 install jedi
pip3 install autopep8
pip3 install --user --upgrade pynvim

# copilot
# git clone https://github.com/github/copilot.vim.git \
#  ~/.config/nvim/pack/github/start/copilot.vim

# ferret dependencies
sudo apt-get install ripgrep

# c/c++ lsp
sudo apt install ccls
