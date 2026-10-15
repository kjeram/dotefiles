-- Clear highlights
vim.keymap.set('n', '<Esc>', vim.cmd.nohlsearch)
-- Exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>')
-- Copy entire file content
vim.keymap.set('n', '<C-c>', '<cmd>%y+<CR>')
-- Replace buffer with default register
vim.keymap.set('n', '<C-a>', 'ggVGP')
-- Switch to alternate buffer
vim.keymap.set('n', '<leader><Tab>', '<cmd>buffer #<CR>')
-- Toggle word wrap
vim.keymap.set('n', 'Z', function() vim.wo.wrap = not vim.wo.wrap end)

vim.keymap.set('n', 'grf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader><S-D>', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>-', vim.cmd.split)  -- Horizontal split
vim.keymap.set('n', '<leader>_', vim.cmd.vsplit) -- Vertical split
vim.keymap.set('n', '<leader>w', '<C-w>')

vim.keymap.set('n', '<leader>s', require('functions').switch_case) -- Switch between snake_case & CamelCase
