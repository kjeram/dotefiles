return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    }
  },

  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets", },
    version = "1.*",
    opts = require "plugins.configs.blink",
    opts_extend = { "sources.default", }
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = true,
    opts = require "plugins.configs.copilotchat",
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function() require 'plugins.configs.copilot' end,
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = require "plugins.configs.gitsigns",
  },

  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" }, }, }, },
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

  { 'AndreM222/copilot-lualine' },

  {
    "stevearc/oil.nvim",
    config = function() require "plugins.configs.oil" end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() require "plugins.configs.treesitter" end,
  },

  {
    "nvim-telescope/telescope.nvim",
    config = function() require "plugins.configs.telescope" end,
  },

  { "xiyaowong/transparent.nvim", },


  { "mason-org/mason.nvim",       opts = {}, },

  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-org/mason-lspconfig.nvim", },
    config = function() require "plugins.configs.lspconfig" end,
  },

  {
    "mfussenegger/nvim-lint",
    dependencies = { "rshkarin/mason-nvim-lint", },
    config = function() require "plugins.configs.lint" end,
  },

  {
    "nvimtools/none-ls.nvim",
    dependencies = { "jay-babu/mason-null-ls.nvim", },
    config = function() require "plugins.configs.nonels" end,
  },

  {
    "folke/which-key.nvim",
    opts = require "plugins.configs.which-key",
  },

}
