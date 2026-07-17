return {
  {
    -- Context menus
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets", },
    version = "1.*",
    opts = require "plugins.configs.blink",
    opts_extend = { "sources.default", }
  },

  {
    -- Theme
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },

  -- { "nvim-lua/plenary.nvim", },

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      lazygit = {}
    }
  },

  {
    -- AI assistant
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = require "plugins.configs.codecompanion",
  },

  {
    -- Git integration
    "lewis6991/gitsigns.nvim",
    opts = require "plugins.configs.gitsigns",
  },

  {
    -- Markdown formatter
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      anti_conceal = { enabled = false },
      file_types = { 'markdown', 'opencode_output' },
    },
    ft = { 'markdown', 'Avante', 'copilot-chat', 'opencode_output' },
  },

  {
    -- Nvim config lint fixer
    "folke/lazydev.nvim",
    ft = "lua",
    opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" }, }, }, },
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
    -- Better syntax highligher or something idk
    "neovim-treesitter/nvim-treesitter",
    dependencies = { "neovim-treesitter/treesitter-parser-registry" },
    build = ":TSUpdate",
    lazy = false,
    config = function() require "plugins.configs.treesitter" end,
  },

  {
    -- Navigations
    "nvim-telescope/telescope.nvim",
    config = function() require "plugins.configs.telescope" end,
  },

  {
    -- TODO|FIXME|NOTE highlighter
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  -- Theme agnostic transparency
  { "xiyaowong/transparent.nvim", },

  -- LSP/Linter manager
  { "mason-org/mason.nvim", opts = {}, },

  {
    -- LSP manager integration
    "neovim/nvim-lspconfig",
    dependencies = { "mason-org/mason-lspconfig.nvim", },
    config = function() require "plugins.configs.lspconfig" end,
  },

  {
    -- Linter integration
    "mfussenegger/nvim-lint",
    dependencies = { "rshkarin/mason-nvim-lint", },
    config = function() require "plugins.configs.lint" end,
  },

  {
    -- Linter to LSP injection or something idk
    "nvimtools/none-ls.nvim",
    dependencies = { "jay-babu/mason-null-ls.nvim", },
    config = function() require "plugins.configs.nonels" end,
  },

  {
    -- Tmux navigations
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
    -- Command cheatsheet
    "folke/which-key.nvim",
    opts = require "plugins.configs.which-key",
  },

}
