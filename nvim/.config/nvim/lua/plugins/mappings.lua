local wk = require 'which-key'
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

-- Add keymaps descriptions
wk.add({
  { 'grf',       desc = 'vim.lsp.buf.format()' },
  { '<leader>Z', desc = 'Toggle word wrap' },
  { '<leader>-', desc = 'Horizontal split' },
  { '<leader>_', desc = 'Vertical split' },
  { '<leader>s', desc = '[S]witch between snake_case & CamelCase' },
})

-- Standalone plugin keys
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

--Telescope
wk.add({ '<leader>f', group = '[F]ind' })
map('n', '<leader>ff', function() ts.find_files({ hidden = true }) end, '[F]iles')
map('n', '<leader>fg', function() ts.live_grep({ hidden = true }) end, '[G]rep')
map('n', '<leader>fh', ts.help_tags, '[H]elp')
map('n', '<leader>fk', ts.keymaps, '[K]eymaps')
map('n', '<leader>fd', ts.diagnostics, '[D]iagnostics')
map('n', '<leader>fb', ts.buffers, '[B]uffer')

wk.add({ '<leader>fr', group = '[R]oot' })
map('n', '<leader>frf', function() ts.find_files({ cwd = vim.env.HOME, hidden = true }) end, '[F]iles')
map('n', '<leader>frg', function() ts.live_grep({ cwd = vim.env.HOME, hidden = true }) end, '[G]rep')

-- Override Neovim's built-in LSP list mappings with Telescope pickers.
map('n', 'grr', ts.lsp_references, 'vim.lsp.buf.references() (telescope)')
map('n', 'grt', ts.lsp_type_definitions, 'vim.lsp.type_definitions() (telescope)')
map('n', 'gO', ts.lsp_document_symbols, 'vim.lsp.buf.document_symbol() (telescope)')
