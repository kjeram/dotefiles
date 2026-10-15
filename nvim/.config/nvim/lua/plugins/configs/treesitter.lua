local languages = {
  "bash",
  "go",
  "lua",
  "markdown",
  "python",
  "sql",
  "vim",
  "vimdoc",
}

require 'nvim-treesitter'.install(languages)

-- Start nvim-treesitter on selected languages
vim.api.nvim_create_autocmd('FileType', {
  pattern = languages,
  callback = function()
    -- syntax highlighting, provided by Neovim
    vim.treesitter.start()
    -- indentation, provided by nvim-treesitter
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
