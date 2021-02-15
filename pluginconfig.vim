

" latex settings
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_compiler_progname='nvr'


" move selection around horizontally, similarly to the mapping for line move
vmap <M-h> <Plug>(MvVisLeft)
vmap <M-l> <Plug>(MvVisRight)

" unfocused split slightly faded
let g:vimade = {}
let g:vimade.normalncid = 'TS'
let g:vimade.fadelevel = 0.8


let g:SnipRun_repl_behavior_enable = ["Python3_jupyter"]


let g:vim_tips_tips_frequency=0.9

let g:nvcode_termcolors=256

"vim-autoformat settings for corect java
let g:formatdef_customjava="'astyle --mode=java --pad-oper -xe'"
let g:formatters_java=['customjava']

" part of vim-polyglot
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_json_syntax_conceal = 0
    
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>

let g:ycm_filetype_blacklist = {"TelescopePrompt" : 0}
autocmd FileType TelescopePrompt let g:ycm_auto_trigger = 1
    
" diagnostic config
" sign define LspDiagnosticsSignError text=⏻ texthl=LspDiagnosticsVirtualTextError linehl= numhl=
" sign define LspDiagnosticsSignWarning text=⏼  texthl=LspDiagnosticsSignWarning
" sign define LspDiagnosticsSignInformation text=⏽ texthl=LspDiagnosticsSignInformation
" sign define LspDiagnosticsSignHint text=⭘ texthl=LspDiagnosticsSignHint


let g:git_messenger_no_default_mappings = v:true

let g:conflict_marker_enable_mappings = 0


" display type hints for rust-analyzer with lsp_extensions.nvim
" autocmd InsertLeave,BufEnter * lua require'lsp_extensions'.inlay_hints{prefix ='', highlight = "Comment"}

" some symbols that match my font (jetbrain mono)@ & ¶ § © ® ™ ° ′ ″ | ¦ † ℓ ‡ № ª º ℮ Δ Ω λ μ π ℕ ¢ ¤ $ ₫ € ƒ £ ₮ ₽ ¥ ∈ ≡ ∃ ∉ ⊄ + − × ÷ = ≠ > < ≥ ≤ ± ≈ ~ ¬ ^ ∞ ∅ ∧ ∨ ∫ ∏ ∑ √ ∂ µ % ‰ ⊂ ⊃ ⊆ ⊇ ∼ ∋ ⁺ ∌ ∐ ∕ ∙ ∣ ∥ ∷ ≉ ⊅ ∀ ↑ ↗ → ↘ ↓ ↙ ← ↖ ↔ ↕ ● ◆ ◊ ■ ▲ ▶ ▼ ◀ ⏻ ⏼ ⭘ ⏽ ⏾ ⍴        . , : ; … ! ¡ ? ¿ · • * # ․ / ( ) { } [ ] - ­ – — _ ‐ ‚ „ “ ” ‘ ’ « » ‹ › " ' ⟨ ⟩

autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
call sign_define('LightBulbSign', { "text" : "●", "texthl": "", "linehl":"", "numhl":"" })

if argc() != 0 
  autocmd VimEnter * silent NERDTreeVCS %|  wincmd p
else
  autocmd VimEnter * silent NERDTreeVCS | wincmd p
end

" returns true iff is NERDTree open/active
function! s:isNTOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction
" calls NERDTreeFind iff NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
function! s:syncTree()
  if &modifiable && s:isNTOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction
autocmd BufEnter * call s:syncTree()


autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif


" large file size in mb
let g:LargeFile=5


"autoformat
"but only with known formatters
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0


"scrollbar
let g:scrollview_current_only = 1



"save / restore session
" register tabnine as completion source
" call asyncomplete#register_source(asyncomplete#sources#tabnine#get_source_options({
"   \ 'name': 'tabnine',
"   \ 'allowlist': ['*'],
"   \ 'completor': function('asyncomplete#sources#tabnine#completor'),
"   \ 'config': {
"   \   'line_limit': 1000,
"   \   'max_num_result': 20,
"   \  },
"   \ }))
"
"
" call asyncomplete#register_source(asyncomplete#sources#nextword#get_source_options({
"             \   'name': 'nextword',
"             \   'allowlist': ['*'],
"             \   'args': ['-n', '10000'],
"             \   'completor': function('asyncomplete#sources#nextword#completor')
"             \   }))
"

