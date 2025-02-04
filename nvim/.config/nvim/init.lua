require("config.lazy")

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.number = true

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader><S-j>", vim.cmd.tabp)
vim.keymap.set("n", "<leader><S-k>", vim.cmd.tabn)
vim.keymap.set("n", "<leader>ct", vim.cmd.tabnew)

-- Make copy-paste less of a hassle
vim.opt.clipboard = 'unnamedplus'
vim.keymap.set("v", "<C-c>", 'y')
