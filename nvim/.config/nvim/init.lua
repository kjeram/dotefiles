require 'options'
require 'filetypes'
require 'autocmd'
require 'keymaps'

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim' -- install path
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    'https://github.com/folke/lazy.nvim.git',
    lazypath
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  spec = require 'plugins',
  install = { colorscheme = { 'catppuccin' } },
  checker = { enabled = true },
})

vim.cmd.colorscheme('catppuccin-mocha')
vim.cmd.TransparentEnable()

-- Load plugin specific keybinds
-- load after lazy due to dependencies
require 'plugins.mappings'
