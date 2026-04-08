require('CopilotChat').setup {
  model = 'gpt-5.3-codex',
  window = {
    layout = "vertical",
    width = 0.5,
  },
  mappings = { complete = { insert = 'Tab', }, },
}

-- Auto-command to customize chat buffer behavior
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = 'copilot-*',
  callback = function()
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
    vim.opt_local.conceallevel = 0

    -- syntax highlighting, provided by Neovim
    vim.treesitter.start()
  end,
})
