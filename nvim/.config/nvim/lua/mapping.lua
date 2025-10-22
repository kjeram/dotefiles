local wk = require("which-key")
local function map(mode, lhs, rhs, desc, plugin)
  if desc ~= nil then
    wk.add({ { lhs, desc = desc } })
  end
  if plugin ~= nil then
    -- Load plugins that are lazy
    vim.keymap.set(mode, lhs, function()
      require("lazy").load({ plugins = { plugin }, })
      vim.cmd(rhs)
    end)
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

-- Enter normal mode from terminal mode
map('t', '<Esc><Esc>', "<C-\\><C-n>", 'Exit terminal mode')

-- Copy entire filecontent
map("n", "<C-c>", "<cmd>%y+<CR>")

-- Replace buffer with default register
map("n", "<C-a>", "ggVGP")

map("n", "Z", function() vim.wo.wrap = not vim.wo.wrap end, "Toggle word wrap")

wk.add { { "<leader>w", group = "[W]indow", proxy = "<C-w>" }, }
map("n", "<leader>w", "<C-w>")

map("n", "<leader>e", vim.cmd.Oil, "File [E]xplorer (Oil)")

wk.add { { "<leader>p", group = "Co[P]ilot", }, }
map("n", "<leader>pc", "CopilotChatToggle", "[C]hat", "CopilotChat.nvim")
map("n", "<leader>pt", "Copilot suggestion toggle_auto_trigger", "[T]oggle", "copilot.lua")

map("n", "<leader>-", vim.cmd.split, "Horizontal split")
map("n", "<leader>_", vim.cmd.vsplit, "Vertical split")

local gitsigns = require "gitsigns"

wk.add({ "<leader>g", group = "[G]it" })
map("n", "<leader>gl", "LazyGit", "[L]azyGit", "lazygit.nvim")
map("n", "<leader>gs", gitsigns.stage_hunk, "[S]tage Hunk")
map("n", "<leader>gr", gitsigns.reset_hunk, "[R]eset Hunk")
map("n", "<leader>gp", gitsigns.preview_hunk, "[P]review Hunk")
map("n", "<leader>gi", gitsigns.preview_hunk_inline, "Preview Hunk [I]nline")

local telescope = require "telescope.builtin"

-- map("n", "<leader><leader>", telescope.buffers, '[ ] Findexisting buffers')

wk.add({ "<leader>f", group = "[F]ind" })
map("n", "<leader>fh", telescope.help_tags, '[H]elp')
map("n", "<leader>fk", telescope.keymaps, '[K]eymaps')
map("n", "<leader>ff", telescope.find_files, '[F]iles')
map("n", "<leader>fs", telescope.builtin, '[S]elect Telescope')
map("n", "<leader>fw", telescope.grep_string, 'Current [W]ord')
map("n", "<leader>fd", telescope.diagnostics, '[D]iagnostics')
-- map("n", "<leader>fg", telescope.live_grep, 'by [G]rep')
map("n", "<leader>fr", telescope.resume, '[R]esume')
map("n", "<leader>f.", telescope.oldfiles, 'Recent Files ("." for repeat)')

wk.add({ "<leader>b", group = "[B]uffer" })
map("n", "<leader>bb", telescope.buffers, 'Opened [B]uffer')
map("n", "<leader>bc", vim.cmd.bwipeout, '[C]lear')
map("n", "<leader>bn", vim.cmd.bn, '[N]ext')
map("n", "<leader>bp", vim.cmd.bp, '[P]revious')
map("n", "<leader>bd", vim.cmd.bd, '[D]elete')

wk.add({ "<leader>l", group = "[L]SP" })
map("n", "<leader>lr", vim.lsp.buf.rename, "[R]ename")
map("n", "<leader>lf", vim.lsp.buf.format, "[F]ormat")
map("n", "<leader>lO", telescope.lsp_document_symbols, "[O]pen Document Symbols")
map("n", "<leader>lW", telescope.lsp_dynamic_workspace_symbols, "Open [W]orkspace Symbols")
map("n", "<leader>ls", vim.cmd.LspInfo, "[S]tatus")

wk.add({ "<leader>lg", group = "[G]oto" })
map("n", "<leader>lgr", telescope.lsp_references, "[R]eferences")
map("n", "<leader>lgd", telescope.lsp_definitions, "[D]efinition")

wk.add({ "<leader>c", group = "[C]onfig" })
map("n", "<leader>cl", vim.cmd.Lazy, "[L]azy")
map("n", "<leader>cm", vim.cmd.Mason, "[M]ason")
