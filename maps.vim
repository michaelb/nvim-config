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
" nmap <leader>ff <Plug>SnipRun
" nmap <leader>f <Plug>SnipRunOperator
" vmap f <Plug>SnipRun


" LSP configs
" nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition() <CR>
nnoremap <silent> ? <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent> ! <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>a <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent> <leader>a <cmd>'<'>lua require('lspsaga.codeaction').range_code_action()<CR>
"scroll down hover doc or scroll in definition preview
"
"show signature help
nnoremap <silent> <leader>s <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>

nnoremap <silent> <leader>r <cmd>lua require('lspsaga.rename').rename()<CR>
nnoremap <silent> <leader>h <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent> <leader>l <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>

"hide selection after hitting return in command mode
nnoremap <silent> <CR> :noh<CR>: <CR>

" redo
nnoremap U <C-R>

"disable fkin recording
map q <Nop>

" fzf-telescope maps
nnoremap <silent> <C-P> :lua require'telescope.builtin'.git_files{} <CR>
nnoremap <silent> <C-O> :lua require'telescope.builtin'.find_files{} <CR>
nnoremap <silent> <C-L> :lua require'telescope.builtin'.tags{}<CR>
nnoremap <silent> <leader>t :lua require'telescope.builtin'.treesitter{}<CR>
nnoremap <silent> <leader>w :lua require'telescope.builtin'.keymaps{}<CR>
nnoremap <silent> <leader>c :lua require'telescope.builtin'.colorscheme{}<CR>





"git merge conflict resolution

nnoremap <silent> <leader>gn <Plug>(conflict-marker-next-hunk)
nnoremap <silent> <leader>gp <Plug>(conflict-marker-prev-hunk)
nnoremap <silent> <leader>go <Plug>(conflict-marker-ourselves)
nnoremap <silent> <leader>gt <Plug>(conflict-marker-themselves)
nnoremap <silent> <leader>gb <Plug>(conflict-marker-both)






"--- some brilliant line movement mappings from junegunn ---"
" move current line up/down
" M = Alt key
" nnoremap <silent> <M-k> :move-2<CR>
" nnoremap <silent> <M-j> :move+<CR>

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

" fat fingers things
cabbr qw wq
cabbr wwq wq
cabbr ww w



let g:vim_printer_print_below_keybinding = '<leader>j'
let g:vim_printer_print_above_keybinding = '<leader>k'


" floating terminal (from lua/terminal.lua)
tnoremap <silent> <leader><leader> <C-\><C-n>:lua require('terminal').toggle()<CR>
nnoremap <silent> <leader><leader> :lua require('terminal').toggle()<CR>


" move between panels while in terminal mode
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l
tnoremap <c-h> <c-\><c-n><c-w>h

" dropdown, persistent terminal, may want to keep
set splitbelow
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction


nnoremap <leader>m :MarkdownPreview<CR>

