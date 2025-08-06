return {
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts = require "plugins.configs.blink",
    opts_extend = { "sources.default" }
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = true,
    opts = require "plugins.configs.which-key",
  },

  {
    'lewis6991/gitsigns.nvim',
     -- opts = require "plugins.configs.gitsigns",
  },

  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = { library = { { path = '${3rd}/luv/library', words = { 'vim%.uv' } }, }, },
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = { "LazyGit", },
    dependencies = { "nvim-lua/plenary.nvim", },
  },

  {
    "nvim-lualine/lualine.nvim",
    config = function() require "plugins.configs.lualine" end,
  },

  {
    "stevearc/oil.nvim",
    config = function() require "plugins.configs.oil" end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function() require "plugins.configs.treesitter" end,
  },

  {
    "folke/which-key.nvim",
    opts = require "plugins.configs.which-key",
  },

  {
    'nvim-telescope/telescope.nvim',
    config = function() require "plugins.configs.telescope" end,
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {}, },
      'mason-org/mason-lspconfig.nvim',
      -- { 'j-hui/fidget.nvim', opts = { notification = { window = { winblend = 0 }, }, }, },
    },
    config = function() require "plugins.configs.nvim-lspconfig" end,
  },

}
