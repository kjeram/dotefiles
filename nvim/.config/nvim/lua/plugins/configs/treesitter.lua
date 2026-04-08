local languages = { "lua", "vim", "vimdoc", "python", "go", "sql" }

require 'nvim-treesitter'.install(languages)

vim.api.nvim_create_autocmd('FileType', {
    pattern = languages,
    callback = function()
      -- syntax highlighting, provided by Neovim
      vim.treesitter.start()
      -- indentation, provided by nvim-treesitter
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })
