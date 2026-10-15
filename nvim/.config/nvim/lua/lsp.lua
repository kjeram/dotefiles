vim.lsp.config('gopls', {
  settings = {
    gopls = {
      gofumpt = true,
      usePlaceholders = true,

      hints = {
        parameterNames = true,
        rangeVariableTypes = true,
      },

      buildFlags = { "-tags=integration" }
    }
  },
})
