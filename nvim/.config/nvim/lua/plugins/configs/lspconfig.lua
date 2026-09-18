vim.diagnostic.config {
  virtual_text = { spacing = 1, },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  },
}

vim.lsp.config('gopls', {
  settings = {
    gopls = {
        buildFlags = {"-tags=integration"}
    }
  },
})

require('mason-lspconfig').setup {
  ensure_installed = {},
  automatic_installation = false,
}
