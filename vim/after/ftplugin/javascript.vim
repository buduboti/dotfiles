
setlocal shiftwidth=2
setlocal tabstop=2
setlocal expandtab

let g:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_fix_on_save = 1
