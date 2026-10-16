local lsps = {
  'bashls',
  'gopls',
  'jsonls',
  'lua_ls',
  'pyright',
  'terraformls',
}

require 'mason-lspconfig'.setup {
  ensure_installed = lsps,
  automatic_installation = true,
}
