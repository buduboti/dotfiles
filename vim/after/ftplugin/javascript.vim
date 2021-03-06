
let g:ale_sign_error = "\ue0b0"
let g:ale_sign_warning = "\ue0b0"

highlight clear ALEErrorSign
highlight clear ALEWarningSign
highlight ALEErrorSign term=bold cterm=bold ctermfg=1
highlight ALEWarningSign term=bold cterm=bold ctermfg=3
highlight ALEError term=bold cterm=bold ctermfg=1 cterm=underline
highlight ALEWarning term=bold cterm=bold ctermfg=3 cterm=underline

setlocal shiftwidth=2
setlocal tabstop=2
setlocal expandtab

let g:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_fix_on_save = 1
