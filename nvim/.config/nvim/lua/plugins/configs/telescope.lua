require 'telescope'.setup {
  pcall(require('telescope').load_extension, 'fzf'),
  pickers = {
    buffers = {
      mappings = {
        n = {
          ["dd"] = require('telescope.actions').delete_buffer,
        }
      }
    }
  }
}
