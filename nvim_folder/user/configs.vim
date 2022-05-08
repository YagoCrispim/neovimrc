" coc extensions
let g:coc_global_extensions = ['coc-angular', 'coc-git', 'coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-styled-components', 'coc-go']

" ack config
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] "Hide files in .gitignore
let g:ctrlp_show_hidden = 1

" default python interpreter
let g:python3_host_prog = $HOME."/.venvs/vim/bin/python"

" prettier config
let g:neoformat_try_node_exe = 1

" nerdtree config
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:NERDTreeWinSize=30

" nedtreetabs config
let g:nerdtree_tabs_smart_startup_focus=2 " always focus in file
let g:nerdtree_tabs_autofind=1

" nerdtreertabs always open
let g:nerdtree_tabs_open_on_startup=2

" buffer line
lua << EOF
require("bufferline").setup{
  options = {
    mode = "tabs",
    reverse = true,
  }
}
EOF

lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "cpp", "typescript", "javascript", "python" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    enable = false,
    additional_vim_regex_highlighting = false,
  },
}
EOF


