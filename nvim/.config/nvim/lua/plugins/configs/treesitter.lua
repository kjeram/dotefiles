require 'nvim-treesitter'.install { "lua", "vim", "vimdoc", "python", "go", "sql" }

vim.api.nvim_create_autocmd('FileType', {
    pattern = { "lua", "vim", "vimdoc", "python", "go", "sql" },
    callback = function()
      -- syntax highlighting, provided by Neovim
      vim.treesitter.start()
      -- indentation, provided by nvim-treesitter
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })
