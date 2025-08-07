require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "vim", "vimdoc", "python", "go", "sql" },
  auto_install = true,
  highlight = {
    enable = true,
    use_languagetree = true
  },
  indent = { enable = true, },
}
