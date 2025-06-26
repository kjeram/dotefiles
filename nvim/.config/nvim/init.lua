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
    { "catppuccin/nvim", name = "catppuccin", priority = 1000, },
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
end
ColorMyPencils()

----------------------
-- General settings --
----------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Make copy-paste less of a hassle
vim.o.clipboard = "unnamedplus"

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

--------------
-- Keybinds --
--------------

-- Reload config (doesn't work)
vim.keymap.set("n", "<leader>rrr", function() vim.cmd [[source ~/.config/nvim/init.lua]] end)

-- Open file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Tab navigation (shift+vimkeys)
vim.keymap.set("n", "<leader><S-h>", vim.cmd.tabp)
vim.keymap.set("n", "<leader><S-l>", vim.cmd.tabn)
-- New tab
vim.keymap.set("n", "<leader>nt", vim.cmd.tabnew)
-- Close tab
vim.keymap.set("n", "<leader>qt", vim.cmd.tabclose)

-- Split panels

