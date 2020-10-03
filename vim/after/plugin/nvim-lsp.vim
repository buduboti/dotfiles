
lua << END
require'nvim_lsp'.clangd.setup{}
require'nvim_lsp'.bashls.setup{}
require'nvim_lsp'.pyls.setup{}
require'nvim_lsp'.tsserver.setup{}
require'nvim_lsp'.vimls.setup{}
require'nvim_lsp'.diagnosticls.setup{}
require'nvim_lsp'.gopls.setup{}
END


nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gy    <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

