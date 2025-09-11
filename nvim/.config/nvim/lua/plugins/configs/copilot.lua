require('copilot').setup {
  panel = { enabled = false, },
  suggestion = {
    enabled = true,
    auto_trigger = false,
    keymap = {
      accept = "<C-y>",
      dismiss = "<C-e>",
      -- accept_word = false,
      -- accept_line = false,
      -- next = "<C-j>",
      -- prev = "<C-k>",
    },
  },
}
