-------------------------
-- Bootstrap lazy.nvim --
-------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    ---------------------------
    -- add your plugins here --
    ---------------------------

    { -- Theme
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000, -- Ensure this is loaded before all other plugins
      integrations = {
        lualine = true,
        gitsigns = true,
        copilot_vim = true,
      },
    },

    {
      "nvim-lualine/lualine.nvim",
      opts = {
        options = {
          theme = "catppuccin",
          icons_enabled = false,
          component_separators = { left = "|", right = "|" },
          section_separators = { left = "", right = "" },
        },
      },
    },

    { -- Popup menu for keybinds
      "folke/which-key.nvim",
      opts = {
        delay = 0,
        spec = {
          { "<leader>s", group = "[S]earch" },
          { "<leader>g", group = "[G]it" },
          { "<leader>f", group = "[F]ile" },
          { "<leader>t", group = "[T]ab" },
          { "<leader>w", group = "[W]indow", proxy = "<C-w>" },
          { "<leader>q", group = "[Q]uit" },
          { "<leader>c", group = "[C]o[P]ilot" },
          { "<leader>cp", group = "[C]o[P]ilot" },
        },
      },
      keys = {
        {
          "<leader>?",
          function()
            require("which-key").show({ global = false })
          end,
          desc = "Buffer Local Keymaps (which-key)",
        },
      },
    },

    { -- File explorer
      "stevearc/oil.nvim",
      opts = { view_options = { show_hidden = true,  }, },
      keys = { { "<leader>fo", "<cmd>Oil<cr>", desc = "[F]ile explore with [O]il" }, },
    },

    { -- Fuzzy Finder
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim', },
      config = function()
        -- Enable Telescope extensions if they are installed
        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        local builtin = require 'telescope.builtin'
        vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
        vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
        vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
        vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
        vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
        vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
        vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
        vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
        vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      end,
    },

    { -- Syntax highlighting and code parsing
      "nvim-treesitter/nvim-treesitter",
      lazy = false, -- This plugin does not support lazy loading
      branch = "main", -- Make sure to specify the main branch
      build = ":TSUpdate",
      opts = {
        ensure_installed = { "lua", "python", "go", },
        highlight = { enable = true },
        indent = { enable = true },
      },
    },

    { -- Copilot Chat (I can no longer code without this (help me))
      "CopilotC-Nvim/CopilotChat.nvim",
      dependencies = {
        { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
        { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
      },
      build = "make tiktoken", -- Only on MacOS or Linux
      opts = {
        -- See Configuration section for options
      },
    },

    -- { -- Language Server Protocol
    --   "neovim/nvim-lspconfig",
    --    dependencies = { { "mason-org/mason.nvim", opts = {} }, },
    -- },

    { -- Adds git related signs to the gutter, as well as utilities for managing changes
      'lewis6991/gitsigns.nvim',
      opts = {
        signs = {
          add =          { text = '+' },
          change =       { text = '~' },
          delete =       { text = '_' },
          topdelete =    { text = '-' },
          changedelete = { text = '~' },
        },
        signs_staged = {
            add =          { text = '|' },
            change =       { text = '~' },
            delete =       { text = '_' },
            topdelete =    { text = '-' },
            changedelete = { text = '~' },
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          vim.keymap.set('n', '<leader>gs', gs.stage_hunk, { buffer = bufnr, desc = "[G]it [S]tage Hunk" })
          vim.keymap.set('n', '<leader>gu', gs.undo_stage_hunk, { buffer = bufnr, desc = "[G]it [U]ndo Stage Hunk" })
          vim.keymap.set('n', '<leader>gr', gs.reset_hunk, { buffer = bufnr, desc = "[G]it [R]eset Hunk" })
          vim.keymap.set('n', '<leader>gp', gs.preview_hunk, { buffer = bufnr, desc = "[G]it [P]review Hunk" })
        end,
      },
    },

    {
      "kdheepak/lazygit.nvim",
      lazy = true,
      cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
      },
      dependencies = { "nvim-lua/plenary.nvim", },
      keys = { { "<leader>glg", "<cmd>LazyGit<cr>", desc = "[G]it [L]azy[G]it" } },
    },

    -----------------
    -- EOF plugins --
    -----------------
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "catppuccin" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-----------
-- Theme --
-----------
function ColorMyPencils(color)
  color = color or "catppuccin-mocha"
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
end
ColorMyPencils()

----------------------
-- General settings --
----------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Make copy-paste less of a hassle
vim.o.clipboard = "unnamedplus"

vim.o.expandtab = true   -- Use spaces instead of tabs
vim.o.shiftwidth = 4     -- Number of spaces per indentation
vim.o.tabstop = 4        -- Number of spaces per tab
vim.o.smartindent = true -- Smart auto-indenting
vim.o.autoindent = true  -- Copy indent from current line when starting new one

-- Set line numbers
vim.o.number = true

-- Enable break indent
vim.o.breakindent = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Show which line your cursor is on
vim.o.cursorline = true

-- Display certain whitespace characters
vim.o.list = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

---------------------
-- Custom commands --
---------------------

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

----------------------
-- Special Keybinds --
----------------------

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

---------------------
-- Leader Keybinds --
---------------------
local wk = require("which-key")

local function keymap_set(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs)
  wk.add({ { lhs, desc = desc } })
end

keymap_set("n", "<leader>fn", vim.cmd.Ex, "[F]ile Explore with [N]etrw")

keymap_set("n", "<leader>qq", vim.cmd.q, "[Q]uit")
keymap_set("n", "<leader>wq", vim.cmd.qw, "[Q]uit [W]rite")
keymap_set("n", "<leader>q!", "<cmd>q!<CR>", "Force [Q]uit[!]")

keymap_set("n", "<leader>l", "<cmd>Lazy<CR>", "[L]azy")

keymap_set("n", "<leader>tp", vim.cmd.tabp, "[T]ab [P]revious")
keymap_set("n", "<leader>tn", vim.cmd.tabn, "[T]ab [N]ext")
keymap_set("n", "<leader>tc", vim.cmd.tabnew, "[T]ab [C]reate")
keymap_set("n", "<leader>tq", vim.cmd.tabclose, "[T]ab [Q]uit")

keymap_set("n", "<leader>cpc", "<cmd>CopilotChat<CR>", "[C]o[P]ilot [C]hat")

keymap_set("n", "<leader>-", vim.cmd.vsplit, "Vertical split")
keymap_set("n", "<leader>_", vim.cmd.split, "Horizontal split") 
