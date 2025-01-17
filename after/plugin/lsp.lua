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
  ensure_installed = {'zls', 'bashls', 'jsonls', 'svelte', 'emmet_ls', 'clangd', 'rust_analyzer', 'tailwindcss', 'gopls', 'templ', 'tsserver', 'htmx', 'html'},
  handlers = {
      lspconfig.zls.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          filetypes = {"zig"},
      }),
    lsp_zero.setup_servers({'dartls', force = true}),
    lspconfig.html.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"typescriptreact", "javascriptreact", "html", "svelte", "templ"}
    }),
    lspconfig.emmet_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"typescriptreact", "javascriptreact", "html", "templ", "svelte"}
    }),
    lspconfig.tailwindcss.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"typescriptreact", "javascriptreact", "html", "templ", "svelte"}
    }),
    lspconfig.htmx.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"html", "templ"}
    }),
    lspconfig.gopls.setup({
        on_attach = on_attach,
        capabilities = capabilites,
        filetypes = {"go", "templ"}
    }),
    lspconfig.tsserver.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"typescript", "typescriptreact", "javascriptreact", "javascript"}
    }),
  },
})


