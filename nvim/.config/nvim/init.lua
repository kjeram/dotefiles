require("config.lazy")

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.number = true

-- Reload config
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

-- Make copy-paste less of a hassle
vim.opt.clipboard = 'unnamedplus'
vim.keymap.set("v", "<C-c>", 'y')
