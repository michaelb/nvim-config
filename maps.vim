nnoremap <Space> <Nop>
let mapleader = " "

"autocompletion stuff
" auto close preview window when done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
function! s:ClosePumOrReturnNewline()
    if pumvisible()
        return "\<C-y>\<CR>"
    else
        return "\<CR>"
    endif
endfunction
inoremap <silent> <CR> <C-r>=<SID>ClosePumOrReturnNewline()<CR>

"quick jump between split
map <C-L> <C-W>l<C-W>
map <C-H> <C-W>h<C-W>
map <C-J> <C-W>j<C-W>
map <C-K> <C-W>k<C-W>

" autoformat with F3 or file save
noremap <F3> :Autoformat<CR>
" au BufWrite * :Autoformat

"git blame/ see commit
nnoremap gb  :GitMessenger<CR>

"sniprun line/bloc shortcut
nnoremap <leader>f :SnipRun<CR>
vnoremap f :SnipRun<CR>


" LSP configs
" nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition() <CR>
nnoremap <silent> ? <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> ! <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
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

" replace with last yank (not deleted or cut)
nnoremap <leader>p "0p
nnoremap <leader>P "0P


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

cabbr qw wq
cabbr wwq wq






" floating terminal (from lua/terminal.lua)
tnoremap <silent> <leader>n <C-\><C-n>:lua require('terminal').toggle()<CR>
nnoremap <silent> <leader>n :lua require('terminal').toggle()<CR>


" move between panels while in terminal mode
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l
tnoremap <c-h> <c-\><c-n><c-w>h

" dropdown, persistent terminal {
set splitbelow
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction

nnoremap <leader>b :call OpenTerminal()<cr>

" turn terminal to normal mode with escape
tnoremap <esc> <c-\><c-n>
" exit with :q
tnoremap <leader>b <c-\><c-n>:q<cr>

