

"autocompletion stuff
" auto close preview window when done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"preview windows on bottom
" set splitbelow





"quick jump between split
map <C-L> <C-W>l<C-W>
map <C-H> <C-W>h<C-W>
map <C-J> <C-W>j<C-W>
map <C-K> <C-W>k<C-W>

" autoformat with F3 or file save
noremap <F3> :Autoformat<CR>
au BufWrite * :Autoformat

"git blame/ see commit
nnoremap gb  :GitMessenger<CR>

"sniprun line/bloc shortcut
nnoremap ff :SnipRun<CR>
vnoremap f :SnipRun<CR>


" LSP configs
" nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition() <CR>
nnoremap <silent> ? <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> ! <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>


"hide selection after hitting return in command mode
nnoremap <silent> <CR> :noh<CR>: <CR>

" redo
nnoremap U <C-R>

"disable fkin recording
map q <Nop>

" fzf maps
nnoremap <silent> <C-P> :GFiles<CR>
nnoremap <silent> <C-L> :Tags<CR>

"--- some brilliant line movement mappings from junegunn ---"
" move current line up/down
" M = Alt key
nnoremap <silent> <M-k> :move-2<CR>
nnoremap <silent> <M-j> :move+<CR>

" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>


" displayed lines navigation, not real line one
nnoremap j gj
nnoremap k gk


