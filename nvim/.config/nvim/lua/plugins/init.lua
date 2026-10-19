return {
  {
    -- Popup completion
    "saghen/blink.cmp",
    version = "1.*",
    opts = require "plugins.configs.blink",
    opts_extend = { "sources.default", }
  },

  {
    -- Insert and skip over pairs
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  {
    -- Theme
    "catppuccin/nvim",
    name = "catppuccin",
    -- Theme agnostic transparency
    dependencies = { "xiyaowong/transparent.nvim", },
    priority = 1000,
  },

  {
    -- Git integration
    "lewis6991/gitsigns.nvim",
    opts = require "plugins.configs.gitsigns",
  },

  {
    -- Nvim config lint fixer
    "folke/lazydev.nvim",
    ft = "lua",
    opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" }, }, }, },
  },

  {
    -- LazyGit
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = { "LazyGit", },
    dependencies = { "nvim-lua/plenary.nvim", },
  },

  {
    -- Status bar
    "nvim-lualine/lualine.nvim",
    config = function() require "plugins.configs.lualine" end,
  },

  {
    -- File explorer
    "stevearc/oil.nvim",
    config = function() require "plugins.configs.oil" end,
  },

  {
    -- Markdown formatter
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      anti_conceal = { enabled = false },
      file_types = { 'markdown' },
    }
  },


  {
    -- Better syntax highligher
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function() require "plugins.configs.treesitter" end,
  },

  {
    -- Navigations
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', },
    },
    config = function() require "plugins.configs.telescope" end,
  },

  {
    -- TODO|FIXME|NOTE highlighter
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  -- LSP/Linter manager
  { "mason-org/mason.nvim", opts = {}, },

  {
    -- LSP manager integration
    "neovim/nvim-lspconfig",
    dependencies = { "mason-org/mason-lspconfig.nvim", },
    config = function() require "plugins.configs.lspconfig" end,
  },

  {
    -- Tmux navigations
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    }
  },

  {
    -- Command cheatsheet
    "folke/which-key.nvim",
    opts = require "plugins.configs.which-key",
  },

}
