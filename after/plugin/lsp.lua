local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('lspconfig').dartls.setup({})
-- here you can setup the language servers
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'clangd', 'rust_analyzer', 'tailwindcss', 'gopls', 'templ', 'tsserver', 'htmx', 'html'},
  handlers = {
    lsp_zero.default_setup, 
  },
})


