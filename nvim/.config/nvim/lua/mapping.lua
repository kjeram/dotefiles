local wk = require 'which-key'
local fn = require 'functions'
local gs = require 'gitsigns'
local ts = require 'telescope.builtin'

local function map(mode, lhs, rhs, desc, plugin)
  if desc ~= nil then
    wk.add({ { lhs, desc = desc } })
  end
  if plugin ~= nil then
    -- Load plugins that are lazy
    vim.keymap.set(mode, lhs, function()
      require('lazy').load({ plugins = { plugin }, })
      vim.cmd(rhs)
    end)
  else
    vim.keymap.set(mode, lhs, rhs)
  end
end

map(
  'n',
  '<leader>?',
  function()
    require('which-key').show({ global = false })
  end,
  'Buffer Local Keymaps (which-key)'
)

-- QoL
map('n', '<Esc>', vim.cmd.nohlsearch, 'Clear highlights')
map('t', '<Esc><Esc>', '<C-\\><C-n>', 'Exit terminal mode')
map('n', '<C-c>', '<cmd>%y+<CR>', 'Copy entire file content')
map('n', '<C-a>', 'ggVGP', 'Replace buffer with default register')
map('n', '<leader><Tab>', '<cmd>buffer #<CR>', 'Switch to alternate buffer')
map('n', 'Z', function() vim.wo.wrap = not vim.wo.wrap end, 'Toggle word wrap')

-- Muscle memory
map('n', '<leader><S-D>', vim.diagnostic.open_float)
map('n', '<leader>-', vim.cmd.split, 'Horizontal split')
map('n', '<leader>_', vim.cmd.vsplit, 'Vertical split')
map('n', '<leader>w', '<C-w>', '[W]indow')

-- Standalone plugin keys
map('n', '<Leader>s', fn.switch_case, '[S]witch between snake_case & CamelCase')
map('n', '<leader>e', vim.cmd.Oil, '[E]xplorer (Oil)')

-- Config keys
wk.add({ '<leader>c', group = '[C]onfig' })
map('n', '<leader>cl', vim.cmd.Lazy, '[L]azy')
map('n', '<leader>cm', vim.cmd.Mason, '[M]ason')

-- Git keys
wk.add({ '<leader>g', group = '[G]it' })
map('n', '<leader>gl', 'LazyGit', '[L]azyGit', 'lazygit.nvim')
map('n', '<leader>gs', gs.stage_hunk, '[S]tage Hunk')
map('n', '<leader>gr', gs.reset_hunk, '[R]eset Hunk')
map('n', '<leader>gp', gs.preview_hunk, '[P]review Hunk')
map('n', '<leader>gb', function() gs.blame_line({ full = true }) end, '[G]it [B]lame')

--telescope / Find
wk.add({ '<leader>f', group = '[F]ind' })
map('n', '<leader>ff', function() ts.find_files({ hidden = true }) end, '[F]iles')
map('n', '<leader>fr', function() ts.find_files({ cwd = vim.env.HOME, hidden = true }) end, '[R]oot files')
map('n', '<leader>fg', function() ts.live_grep({ hidden = true }) end, '[G]rep')
map('n', '<leader>fh', ts.help_tags, '[H]elp')
map('n', '<leader>fk', ts.keymaps, '[K]eymaps')
map('n', '<leader>fd', ts.diagnostics, '[D]iagnostics')
map('n', '<leader>fb', ts.buffers, '[B]uffer')

-- Override Neovim's built-in LSP list mappings with Telescope pickers.
map('n', 'grr', ts.lsp_references, 'vim.lsp.buf.references() (telescope)')
map('n', 'gO', ts.lsp_document_symbols, 'vim.lsp.buf.document_symbol() (telescope)')
