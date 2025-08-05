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

map("n", "<leader>f", vim.cmd.Oil, "File explorer (Oil)")

wk.add{ { "<leader>w", group = "[W]indow", proxy = "<C-w>" }, }
map("n", "<leader>w", "<C-w>") -- proxy 

map("n", "<C-c>", "<cmd>%y+<CR>") -- copy filecontent

wk.add( { "<leader>c", group = "[C]o[P]ilot" }, { "<leader>cp", group = "[C]o[P]ilot" })
map("n", "<leader>cpc", "CopilotChatToggle", "[C]o[P]ilot [C]hat", "CopilotChat.nvim")

map("n", "<leader>-", vim.cmd.split, "Horizontal split")
map("n", "<leader>_", vim.cmd.vsplit, "Vertical split")

wk.add( { "<leader>s", group = "[S]earch" } )
local tb = require "telescope.builtin"
map("n", "<leader>sh", tb.help_tags, '[S]end [H]elp')
map("n", "<leader>sk", tb.keymaps, '[S]earch [K]eymaps')
map("n", "<leader>sf", tb.find_files, '[S]earch [F]iles')
map("n", "<leader>ss", tb.builtin, '[S]earch [S]elect Telescope')
map("n", "<leader>sw", tb.grep_string, '[S]earch current [W]ord')
map("n", "<leader>sg", tb.live_grep,  '[S]earch by [G]rep')
map("n", "<leader>sr", tb.resume,  '[S]earch [R]esume')
map("n", "<leader>s.", tb.oldfiles,  '[S]earch Recent Files ("." for repeat)')
map("n", "<leader><leader>", tb.buffers, '[ ] Findexisting buffers')

wk.add( { "<leader>l", group = "[L]SP" } )
map("n", "<leader>lr", vim.lsp.buf.rename, "[R]ename")
wk.add( { "<leader>lg", group = "[L]SP [G]oto" } )
map("n", "<leader>lga", vim.lsp.buf.code_action, "[G]oto Code [A]ction")
map("n", "<leader>lgr", tb.lsp_references, "[G]oto [R]eferences")

wk.add( { "<leader>g", group = "[G]it" } )
map("n", "<leader>glg", "LazyGit", "[G]it [L]azy[G]it", "lazygit.nvim")
