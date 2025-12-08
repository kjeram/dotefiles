return {
  blink_cmp = { style = 'bordered', },
  keymap = {
    preset = "super-tab",
    ["<C-k>"] = { "scroll_documentation_up", },
    ["<C-j>"] = { "scroll_documentation_down", },
  },
  fuzzy = { implementation = "lua" },
  completion = {
    menu = { border = "none", },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
      window = { scrollbar = false, },
    },
    list = { selection = { auto_insert = false, }, },
  },
}
