require("mason").setup()
require("mason-null-ls").setup({
    ensure_installed = {},
    automatic_installation = false,
    handlers = {},
})
require("null-ls").setup({
    sources = {}
})
