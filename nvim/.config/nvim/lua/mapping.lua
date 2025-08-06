local wk = require("which-key")
local function map(mode, lhs, rhs, desc, plugin)
  if desc ~= nil then
    wk.add({ { lhs, desc = desc } })
  end
  if plugin ~= nil then
    -- Load plugins that are lazy
    vim.keymap.set(mode, lhs, function() require("lazy").load({ plugins = { plugin }, }) vim.cmd(rhs) end)
  else
    vim.keymap.set(mode, lhs, rhs)
  end
end

map(
  "n",
  "<leader>?",
  function()
    require("which-key").show({ global = false })
  end,
  "Buffer Local Keymaps (which-key)"
)

-- Clear highlights on search when pressing <Esc> in normal mode
map("n", "<Esc>", vim.cmd.nohlsearch)


wk.add{ { "<leader>w", group = "[W]indow", proxy = "<C-w>" }, }
map("n", "<leader>w", "<C-w>") -- proxy 

map("n", "<C-c>", "<cmd>%y+<CR>") -- copy filecontent

map("n", "<leader>e", vim.cmd.Oil, "File [E]xplorer (Oil)")

map("n", "<leader>pc", "CopilotChatToggle", "Co[P]ilot [C]hat", "CopilotChat.nvim")

map("n", "<leader>-", vim.cmd.split, "Horizontal split")
map("n", "<leader>_", vim.cmd.vsplit, "Vertical split")

local gitsigns = require "gitsigns"

wk.add( { "<leader>g", group = "[G]it" } )
map("n", "<leader>gl", "LazyGit", "[G]it [L]azyGit", "lazygit.nvim")
map("n", "<leader>gs", gitsigns.stage_hunk, "[G]it [S]tage Hunk")
map("n", "<leader>gr", gitsigns.reset_hunk, "[G]it [R]eset Hunk")
map("n", "<leader>gp", gitsigns.preview_hunk, "[G]it [P]review Hunk")
map("n", "<leader>gi", gitsigns.preview_hunk_inline, "[G]it Preview Hunk [I]nline")

local telescope = require "telescope.builtin"

map("n", "<leader><leader>", telescope.buffers, '[ ] Findexisting buffers')

wk.add( { "<leader>f", group = "[F]ind" } )
map("n", "<leader>fh", telescope.help_tags, '[F]ind [H]elp')
map("n", "<leader>fk", telescope.keymaps, '[F]ind [K]eymaps')
map("n", "<leader>ff", telescope.find_files, '[F]ind [F]iles')
map("n", "<leader>fs", telescope.builtin, '[F]ind [S]elect Telescope')
map("n", "<leader>fw", telescope.grep_string, '[F]ind current [W]ord')
map("n", "<leader>fg", telescope.live_grep,  '[F]ind by [G]rep')
map("n", "<leader>fr", telescope.resume,  '[F]ind [R]esume')
map("n", "<leader>f.", telescope.oldfiles,  '[F]ind Recent Files ("." for repeat)')

wk.add( { "<leader>l", group = "[L]SP" } )
map("n", "<leader>lr", vim.lsp.buf.rename, "[R]ename")
map("n", "<leader>lO", telescope.lsp_document_symbols, "[O]pen Document Symbols")
map("n", "<leader>lO", telescope.lsp_dynamic_workspace_symbols, "Open [W]orkspace Symbols")

wk.add( { "<leader>lg", group = "[L]SP [G]oto" } )
map("n", "<leader>lga", vim.lsp.buf.code_action, "[G]oto Code [A]ction")
map("n", "<leader>lgr", telescope.lsp_references, "[G]oto [R]eferences")
map("n", "<leader>lgd", telescope.lsp_definitions, "[G]oto [D]efinition")

-- map("n", "<leader>lgi", tb.lsp_implementation, "[G]oto [I]mplementation")
-- map("n", "<leader>lgt", tb.lsp_type_definition, "[G]oto [T]ype Definition")
-- map("n", "<leader>lgD", tb.lsp_declaration, "[G]oto [D]eclaration")


wk.add( { "<leader>c", group = "[C]onfig" } )
map("n", "<leader>cl", vim.cmd.Lazy, "[C]onfig [L]azy")
map("n", "<leader>cm", vim.cmd.Mason, "[C]onfig [M]ason")
