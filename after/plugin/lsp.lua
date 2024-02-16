local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

local lspconfig = require('lspconfig')
-- here you can setup the language servers
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'svelte', 'emmet_ls', 'clangd', 'rust_analyzer', 'tailwindcss', 'gopls', 'templ', 'tsserver', 'htmx', 'html'},
  handlers = {
    lsp_zero.default_setup,
    lspconfig.html.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"html", "svelte", "templ"}
    }),
    lspconfig.emmet_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"html", "templ", "svelte"}
    }),
    lspconfig.tailwindcss.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"html", "templ", "svelte"}
    }),
    lspconfig.htmx.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"html", "templ"}
    })
  },
})


