

" latex settings
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'



" unfocused split slightly faded
let g:vimade = {}
let g:vimade.fadelevel = 0.8


let g:vim_tips_tips_frequency=0.9


"vim-autoformat settings for corect java
let g:formatdef_customjava="'astyle --mode=java --pad-oper -xe'"
let g:formatters_java=['customjava']



" part of vim-polyglot
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_json_syntax_conceal = 0

" diagnostic config
let g:diagnostic_enable_virtual_text=1
let g:diagnostic_level = 'Warning'
let g:diagnostic_virtual_text_prefix = '<<'
let g:diagnostic_trimmed_virtual_text = 20
let g:diagnostic_insert_delay = 1
let g:diagnostic_enable_underline = 0
call sign_define("LspDiagnosticsErrorSign", {"text" : "✘", "texthl" : "LspDiagnosticsError"})
call sign_define("LspDiagnosticsWarningSign", {"text" : "⚡", "texthl" : "LspDiagnosticsWarning"})
call sign_define("LspDiagnosticsInformationSign", {"text" : "I", "texthl" : "LspDiagnosticsInformation"})
call sign_define("LspDiagnosticsHintSign", {"text" : "H", "texthl" : "LspDiagnosticsWarning"})

" to activate when its become cool
" nmap <silent> m :NextDiagnosticCycle<CR>
" nmap <silent>   :PrevDiagnosticCycle<CR>

" display type hints
" autocmd InsertLeave,BufEnter * lua require'lsp_extensions'.inlay_hints{prefix ='', highlight = "Comment"}



" large file size in mb
let g:LargeFile=2


"autoformat
"but only with known formatters
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0


augroup my_config_scrollbar_nvim
    autocmd!
    autocmd BufEnter    * silent! lua require('scrollbar').show()
    autocmd BufLeave    * silent! lua require('scrollbar').clear()

    autocmd CursorMoved * silent! lua require('scrollbar').show()
    autocmd VimResized  * silent! lua require('scrollbar').show()

    autocmd FocusGained * silent! lua require('scrollbar').show()
    autocmd FocusLost   * silent! lua require('scrollbar').clear()
augroup end


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
