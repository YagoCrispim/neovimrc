#!/bin/bash

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

npm i -g yarn

mkdir -r ~/.config/nvim
cp init.vim ~/.config/nvim/
touch ~/.config/nvim/sessions

# ./install_deps.sh
