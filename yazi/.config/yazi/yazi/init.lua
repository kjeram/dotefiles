local catppuccin_mocha = {
  rosewater = "#f5e0dc",
  flamingo = "#f2cdcd",
  pink = "#f5c2e7",
  mauve = "#cba6f7",
  red = "#f38ba8",
  maroon = "#eba0ac",
  peach = "#fab387",
  yellow = "#f9e2af",
  green = "#a6e3a1",
  teal = "#94e2d5",
  sky = "#89dceb",
  sapphire = "#74c7ec",
  blue = "#89b4fa",
  lavender = "#b4befe",
  text = "#cdd6f4",
  subtext1 = "#bac2de",
  subtext0 = "#a6adc8",
  overlay2 = "#9399b2",
  overlay1 = "#7f849c",
  overlay0 = "#6c7086",
  surface2 = "#585b70",
  surface1 = "#45475a",
  surface0 = "#313244",
  base = "#1e1e2e",
  mantle = "#181825",
  crust = "#11111b",
}

require("full-border"):setup()

require("yatline"):setup({
  section_separator = { open = "", close = "" },
  part_separator = { open = "", close = "" },
  inverse_separator = { open = "", close = "" },

  style_a = {
    fg = catppuccin_mocha.mantle,
    bg_mode = {
      normal = catppuccin_mocha.blue,
      select = catppuccin_mocha.mauve,
      un_set = catppuccin_mocha.red,
    },
  },
  style_b = { bg = catppuccin_mocha.surface0, fg = catppuccin_mocha.text },
  style_c = { fg = catppuccin_mocha.text },

  permissions_t_fg = catppuccin_mocha.green,
  permissions_r_fg = catppuccin_mocha.yellow,
  permissions_w_fg = catppuccin_mocha.red,
  permissions_x_fg = catppuccin_mocha.sky,
  permissions_s_fg = catppuccin_mocha.lavender,

  tab_width = 20,
  tab_use_inverse = false,

  selected = { icon = "󰻭", fg = catppuccin_mocha.yellow },
  copied = { icon = "", fg = catppuccin_mocha.green },
  cut = { icon = "", fg = catppuccin_mocha.red },

  total = { icon = "", fg = catppuccin_mocha.yellow },
  succ = { icon = "", fg = catppuccin_mocha.green },
  fail = { icon = "", fg = catppuccin_mocha.red },
  found = { icon = "", fg = catppuccin_mocha.blue },
  processed = { icon = "", fg = catppuccin_mocha.green },

  show_background = false,

  display_header_line = true,
  display_status_line = true,

  component_positions = { "header", "tab", "status" },

  header_line = {
    left = {
      section_a = {
        { type = "line", custom = false, name = "tabs", params = {"left"}, },
      },
      section_b = {},
      section_c = {}
    },
    right = {
      section_a = {
        -- { type = "string", custom = false, name = "date", params = {"%A, %d %B %Y"}, },
      },
      section_b = {
        -- { type = "string", custom = false, name = "date", params = {"%X"}, },
      },
      section_c = {}
    }
  },

  status_line = {
    left = {
      section_a = {
        { type = "string", custom = false, name = "tab_mode", },
      },
      section_b = {
        { type = "string", custom = false, name = "hovered_size", },
      },
      section_c = {
        { type = "string", custom = false, name = "hovered_path", },
        { type = "coloreds", custom = false, name = "count", },
      }
    },
    right = {
      section_a = {
        { type = "string", custom = false, name = "cursor_position", },
      },
      section_b = {
        { type = "string", custom = false, name = "cursor_percentage", },
      },
      section_c = {
        { type = "string", custom = false, name = "hovered_file_extension", params = {true}, },
        { type = "coloreds", custom = false, name = "permissions"},
      }
    }
  },

  prefix_color = catppuccin_mocha.subtext0,
  branch_color = catppuccin_mocha.sapphire,
  commit_color = catppuccin_mocha.mauve,
  behind_color = catppuccin_mocha.flamingo,
  ahead_color = catppuccin_mocha.lavender,
  stashes_color = catppuccin_mocha.pink,
  state_color = catppuccin_mocha.maroon,
  staged_color = catppuccin_mocha.yellow,
  unstaged_color = catppuccin_mocha.peach,
  untracked_color = catppuccin_mocha.teal,
})
