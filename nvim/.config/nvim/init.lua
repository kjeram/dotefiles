require "options"
require "filetypes"
require "autocmd"

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" -- install path
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = require "plugins",
  install = { colorscheme = { "catppuccin" } },
  checker = { enabled = true },
})

vim.cmd.colorscheme("catppuccin-mocha")
vim.cmd.TransparentEnable()

-- maps load after lazy due to dependencies
-- mainly which-key
require "mapping"
