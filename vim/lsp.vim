hi LspDiagnosticsDefaultError				term=bold cterm=bold ctermfg=1 cterm=underline
hi LspDiagnosticsVirtualTextError			term=bold cterm=bold ctermfg=1 
hi LspDiagnosticsUnderlineError				term=bold cterm=bold ctermfg=1 cterm=underline
hi LspDiagnosticsFloatingError				term=bold cterm=bold ctermfg=1 cterm=underline
hi LspDiagnosticsSignError					term=bold cterm=bold ctermfg=1 

hi LspDiagnosticsDefaultWarning				term=bold cterm=bold ctermfg=3 cterm=underline
hi LspDiagnosticsVirtualTextWarning			term=bold cterm=bold ctermfg=3
hi LspDiagnosticsUnderlineWarning			term=bold cterm=bold ctermfg=3 cterm=underline
hi LspDiagnosticsFloatingWarning			term=bold cterm=bold ctermfg=3 cterm=underline
hi LspDiagnosticsSignWarning				term=bold cterm=bold ctermfg=3

hi LspDiagnosticsDefaultHint				term=bold cterm=bold ctermfg=8 cterm=underline
hi LspDiagnosticsVirtualTextHint			term=bold cterm=bold ctermfg=8
hi LspDiagnosticsUnderlineHint				term=bold cterm=bold ctermfg=8 cterm=underline
hi LspDiagnosticsFloatingHint				term=bold cterm=bold ctermfg=8 cterm=underline
hi LspDiagnosticsSignHint					term=bold cterm=bold ctermfg=8

hi LspDiagnosticsDefaultInformation			term=bold cterm=bold ctermfg=12 cterm=underline
hi LspDiagnosticsVirtualTextInformation		term=bold cterm=bold ctermfg=12
hi LspDiagnosticsUnderlineInformation		term=bold cterm=bold ctermfg=12 cterm=underline
hi LspDiagnosticsFloatingInformation		term=bold cterm=bold ctermfg=12 cterm=underline
hi LspDiagnosticsSignInformation			term=bold cterm=bold ctermfg=12

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
" let g:diagnostic_virtual_text_prefix = ''

sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError linehl=
sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning linehl=
sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl=
sign define LspDiagnosticsSignHint text=ﯦ texthl=LspDiagnosticsSignHint linehl=

lua require("lsp_config")

autocmd BufWritePost * lua vim.lsp.buf.formatting()
