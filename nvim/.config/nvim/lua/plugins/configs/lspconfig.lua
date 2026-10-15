local lsps = {
  'bashls',
  'gopls',
  'lua_ls',
  'jsonls',
  'pyright',
  'terraformls',
}

require 'mason-lspconfig'.setup {
  ensure_installed = lsps,
  automatic_installation = true,
}
