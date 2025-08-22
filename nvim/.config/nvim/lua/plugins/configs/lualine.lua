require("lualine").setup {
  options = {
    icons_enabled = true,
    globalstatus = false,
    component_separators = { left = "|", right = "|" },
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = { function() return vim.fn.mode():sub(1, 1):upper() end },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = {
      -- "lsp_status",
      -- "encoding",
      -- "fileformat",
      "filetype",
    },
    lualine_y = { "progress" },
    lualine_z = { "location" }
  },
}
