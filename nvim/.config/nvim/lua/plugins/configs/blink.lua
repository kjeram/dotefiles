return {
  keymap = {
    preset = "super-tab",
    ["<C-k>"] = { "scroll_documentation_up", },
    ["<C-j>"] = { "scroll_documentation_down", },
  },
  fuzzy = { implementation = "lua" },
  completion = {
    list = { selection = { auto_insert = false, }, },
    menu = { border = "none", },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
      window = { scrollbar = false, },
    },
  },
  sources = { default = { "lsp", "path", "buffer", }, },
}
