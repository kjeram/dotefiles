require 'telescope'.setup {
  pcall(require('telescope').load_extension, 'fzf'),
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<C-q>"] = require('telescope.actions').delete_buffer,
        },
        n = {
          ["<C-q>"] = require('telescope.actions').delete_buffer,
        }
      }
    }
  }
}
