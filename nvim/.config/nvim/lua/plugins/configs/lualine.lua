require("lualine").setup {
  options = {
    icons_enabled = true,
    component_separators = { left = "|", right = "|" },
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = { function() return vim.fn.mode():sub(1, 1):upper() end },
    lualine_x = {
      "lsp_status",
      -- -- Copilot status component for lualine
      -- function()
      --   local enabled = vim.fn.exists("*copilot#Enabled") == 1 and vim.fn["copilot#Enabled"]() or nil
      --   if enabled == 1 then
      --      return " "
      --   elseif enabled == 0 then
      --     return " "
      --   else
      --     return ""
      --   end
      -- end,
      -- "encoding",
      "fileformat",
      "filetype"
    },
  },
}
