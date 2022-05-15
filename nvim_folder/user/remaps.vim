" ================================
"           TELESCOPE
" ================================
" ctrl + p fuzzy finder
map <C-p> <cmd>Telescope find_files<cr>

" --

" ================================
"       NERDTreeTabs/NERDTree
" ================================
" always open on every tab
nnoremap <Leader>ao :NERDTreeTabsOpen<CR>
nnoremap <Leader>ac :NERDTreeTabsClose<CR>
nnoremap <silent> <C-b> :NERDTreeMirrorToggle<CR>
nnoremap <Leader>ff :NERDTreeTabsFind<CR>

" navigate between tabs using alt + pageUp / pageDown
noremap <A-PageUp> :BufferLineCyclePrev<CR> 
vnoremap <A-PageUp> <C-C>:BufferLineCyclePrev<CR>
inoremap <A-PageUp> <C-O>:BufferLineCyclePrev<CR>
noremap <A-PageDown> :BufferLineCycleNext<CR>
vnoremap <A-PageDown> <C-C>:BufferLineCycleNext<CR>
inoremap <A-PageDown> <C-O>:BufferLineCycleNext<CR>

" switch between spaces using alt and arrow keys
tnoremap <A-Left> <C-\><C-n><C-w>h
tnoremap <A-Down> <C-\><C-n><C-w>j
tnoremap <A-Up> <C-\><C-n><C-w>k
tnoremap <A-Right> <C-\><C-n><C-w>l
nnoremap <A-Left> <C-w>h
nnoremap <A-Down> <C-w>j
nnoremap <A-Up> <C-w>k
nnoremap <A-Right> <C-w>l

" --

" ================================
"           CocActions
" ================================
" open autocomplete
inoremap <silent><expr> <c-space> coc#refresh()

" ctrl + s to save
noremap <silent> <C-S>          :w<CR>
vnoremap <silent> <C-S>         <C-C>:w<CR>
inoremap <silent> <C-S>         <C-O>:w<CR>

" coc-commands
xmap <silent> <F3>  <Plug>(coc-codeaction-selected)
nmap <silent> <F3>  <Plug>(coc-codeaction-selected)

" rename var
nmap <F2> <Plug>(coc-rename)

" coc-definition
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gs :call CocAction('jumpDefinition', 'split')<CR>
nmap <silent> gd :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gt :call CocAction('jumpDefinition', 'tabe')<CR>
nmap <silent> vd :call CocAction('jumpDefinition')<CR>

" prettier
vmap <leader>pf :call CocAction('runCommand', 'prettier.formatFile')<CR>
nmap <leader>pf :call CocAction('runCommand', 'prettier.formatFile')<CR>

" --

" ================================
"           VimSpector
" ================================
" run debugger
nnoremap <F5> :call vimspector#Launch()<CR>

" restart debugger
nmap <Leader>rd <Plug>VimspectorRestart

" handler set and unset of breakpoints
nnoremap <Leader>sd :call vimspector#Reset()<CR> " stop debugging
nnoremap <Leader>tb :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>rb :call vimspector#ClearBreakpoints()<CR>
nnoremap <Leader>cb :call vimspector#ClearLineBreakpoint( @%, line(".") )<CR>

" navigate to next/previous breakpoint
nmap <Leader><Left> <Plug>VimspectorStepOut
nmap <Leader><Up> <Plug>VimspectorStepInto
nmap <Leader><Right> <Plug>VimspectorStepOver
nmap <Leader><Down> :call vimspector#Continue()<CR>
nmap <leader>nh :noh<CR>

" --


" ================================
"             Other
" ================================
" add space and 2 spaces between {}
inoremap {<Enter> {<Enter>}<Esc>O

" accept autocomplete with tab
inoremap <expr> <TAB> pumvisible() ? "<C-y>" : "<TAB>"

" navigation through long line wrapped
vmap <Down> gj
nmap <Down> gj
vmap <Up> gk
nmap <Up> gk

" ctrl + w to leave file
nnoremap <silent> <C-W>         <C-C>:q<CR>

" reload current file
nmap <F6> :e<CR>

" Escaping from terminal
" tnoremap <esc> <C-\><C-N>

" if wrap toggle to nowrap
nnoremap <Leader>nw :set nowrap<CR>
nnoremap <Leader>w :set wrap<CR>

" session control
nnoremap <leader>ms :mksession! ~/.config/nvim/sessions<CR>
nnoremap <leader>ls :source ~/.config/nvim/sessions<CR>

" ack remap
" ctrl + f f to search for file
nmap     <C-F>f <Plug>CtrlSFPrompt                  
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath

" copilot
imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" toggle terminal
nmap <C-j> :ToggleTerm size=15 dir=. direction=horizontal<CR>

" map to enable copilot
nmap <Leader>ec :Copilot enable<CR>

