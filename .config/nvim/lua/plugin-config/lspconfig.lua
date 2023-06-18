lspconfig = require('lspconfig')

lspconfig.ccls.setup{}
lspconfig.serve_d.setup{}
lspconfig.phpactor.setup{}
lspconfig.gdscript.setup{}
lspconfig.jedi_language_server.setup{}

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.keymap.set('n', '<leader>d', vim.lsp.buf.declaration, {buffer=bufnr})
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.definition, {buffer=bufnr})
  vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, {buffer=bufnr})
  vim.keymap.set('n', '<leader>t', vim.lsp.buf.type_definition, {buffer=bufnr})
  vim.keymap.set('n', '<leader>r', vim.lsp.buf.references, {buffer=bufnr})
  vim.keymap.set('n', '<leader>R', vim.lsp.buf.rename, {buffer=bufnr})
  vim.keymap.set('n', '<leader>=', vim.lsp.buf.format, {buffer=bufnr})
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
  'ccls', 'serve_d', 'phpactor', 'gdscript', 'jedi_language_server'
}
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end

