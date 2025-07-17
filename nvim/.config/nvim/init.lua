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

    { -- Soothing pastel theme for the high-spirited! Something like that...
       "catppuccin/nvim",
       name = "catppuccin",
       priority = 1000, -- Ensure this is loaded before all other plugins
    },

    { -- Popup menu for keybinds (because I have short-term memory loss)
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = { delay = 0, },
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

    { -- Maybe a little oil?
      "stevearc/oil.nvim",
      opts = {
        view_options = {
          show_hidden = true, -- Show hidden files
        },
      },
      keys = {
        { "<leader>fo", "<cmd>Oil<cr>", desc = "Open Oil" },
      },
    },

    { -- Makes new lines in lua not tabbed (not really)
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      opts = {
        ensure_installed = { "lua", "python", "go", },
        highlight = { enable = true },
        indent = { enable = true },
      },
    },

    { -- Language Server Protocol
      "neovim/nvim-lspconfig",
       dependencies = {
         { "mason-org/mason.nvim", opts = {} },
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
      -- See Commands section for default commands if you want to lazy load on them
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

vim.o.expandtab = true      -- Use spaces instead of tabs
vim.o.shiftwidth = 4        -- Number of spaces per indentation
vim.o.tabstop = 4           -- Number of spaces per tab
vim.o.smartindent = true    -- Smart auto-indenting
vim.o.autoindent = true     -- Copy indent from current line when starting new one

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

keymap_set("n", "<leader>rrr",
  function() vim.cmd [[source ~/.config/nvim/init.lua]] end,
  "Reload config"
)

keymap_set("n", "<leader>pv", vim.cmd.Ex, "Open Netrw")

keymap_set("n", "<leader><S-h>", vim.cmd.tabp, "Previous Tab")
keymap_set("n", "<leader><S-l>", vim.cmd.tabn, "Next Tab")

keymap_set("n", "<leader>nt", vim.cmd.tabnew, "New Tab")
keymap_set("n", "<leader>qt", vim.cmd.tabclose, "Close Tab")

keymap_set("n", "<leader>-", vim.cmd.vsplit, "Vertical split")
keymap_set("n", "<leader>_", vim.cmd.split, "Horizontal split") 
keymap_set("n", "<leader><Tab>", "<C-w>w", "Go to Last Split")

keymap_set("n", "<leader>cpc", "<cmd>CopilotChat<CR>", "Open Copilot Chat")

