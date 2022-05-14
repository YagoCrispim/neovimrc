" =-=-=-=-=-=-=-= PLUGINS =-=-=-=-=-=-=-=
if empty(glob('~/.config/nvim/autoload/plug.vim')) " this will install vim-plug if not installed
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
  " this is for auto complete, prettier and tslintings needed
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

  " js/ts
  Plug 'yuezk/vim-js'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'maxmellon/vim-jsx-pretty'

  " python
  " Plug 'davidhalter/jedi-vim' 

  " nerdtree
  Plug 'scrooloose/nerdtree'
  Plug 'jistr/vim-nerdtree-tabs'

  " everforest theme
  " Plug 'sainnhe/everforest'

  " dracula theme
  Plug 'dracula/vim', { 'as': 'dracula' }

  " gruvbox
  " Plug 'ellisonleao/gruvbox.nvim'

  " ident lines level
  Plug 'lukas-reineke/indent-blankline.nvim'

  " comment/uncomment tool
  Plug 'scrooloose/nerdcommenter'

  " A cool status bar
  Plug 'vim-airline/vim-airline'

  " intellisense engine
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " auto-close braces and scopes
  Plug 'jiangmiao/auto-pairs'

  " debugger
  Plug 'puremourning/vimspector' 

  " multi cursor
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}

  " load extensions like VSCode and host language servers
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " prettier
  Plug 'sbdchd/neoformat'

  " terminal
  Plug 'akinsho/toggleterm.nvim'

  " buffer lines
  Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
  " Plug 'ryanoasis/vim-devicons' Icons without colours
  Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

  " treesiter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()
