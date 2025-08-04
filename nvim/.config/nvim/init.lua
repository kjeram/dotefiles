-------------------------
-- Bootstrap lazy.nvim --
-------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    ---------------------------
    -- add your plugins here --
    ---------------------------

    { -- Theme
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000, -- Ensure this is loaded before all other plugins
      integrations = {
        lualine = true,
        gitsigns = true,
        copilot_vim = true,
      },
    },

    {
      "nvim-lualine/lualine.nvim",
      opts = {
        options = {
          theme = "catppuccin",
          icons_enabled = true,
          component_separators = { left = "|", right = "|" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { function() return vim.fn.mode():sub(1,1):upper() end },
          lualine_x = {
            "lsp_status",
            -- Copilot status component for lualine
            function()
              local enabled = vim.fn.exists("*copilot#Enabled") == 1 and vim.fn["copilot#Enabled"]() or nil
              if enabled == 1 then
                 return " "
              elseif enabled == 0 then
                return " "
              else
                return ""
              end
            end,
            -- "encoding",
            "fileformat",
            "filetype"
          },
        },
      },
    },

    { -- Popup menu for keybinds
      "folke/which-key.nvim",
      opts = {
        delay = 0,
        spec = {
          { "<leader>s", group = "[S]earch" },
          { "<leader>g", group = "[G]it" },
          { "<leader>f", group = "[F]ile" },
          { "<leader>t", group = "[T]ab" },
          { "<leader>w", group = "[W]indow", proxy = "<C-w>" },
          { "<leader>l", group = "[L]SP" },
          { "<leader>c", group = "[C]o[P]ilot" },
          { "<leader>cp", group = "[C]o[P]ilot" },
        },
      },
      keys = {
        {
          "<leader>?",
          function()
            require("which-key").show({ global = false })
          end,
          desc = "Buffer Local Keymaps (which-key)",
        },
      },
    },

    { -- File explorer
      "stevearc/oil.nvim",
      opts = { view_options = { show_hidden = true,  }, },
      keys = { { "<leader>fo", "<cmd>Oil<cr>", desc = "[F]ile explore with [O]il" }, },
    },

    { -- Fuzzy Finder
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim', },
      config = function()
        -- Enable Telescope extensions if they are installed
        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        local builtin = require 'telescope.builtin'
        vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
        vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
        vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
        vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
        vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
        vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
        vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
        vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
        vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      end,
    },

    { -- Highlight, edit, and navigate code
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      main = 'nvim-treesitter.configs', -- Sets main module to use for opts
      opts = {
        ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', },
        -- Autoinstall languages that are not installed
        auto_install = true,
        highlight = {
          enable = true,
          -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
          --  If you are experiencing weird indenting issues, add the language to
          --  the list of additional_vim_regex_highlighting and disabled languages for indent.
          additional_vim_regex_highlighting = { 'ruby' },
        },
        indent = { enable = true, disable = { 'ruby' } },
      },
    },

    { -- Copilot Chat (I can no longer code without this (help me))
      "CopilotC-Nvim/CopilotChat.nvim",
      dependencies = {
        {
          "github/copilot.vim",
          config = function()
            vim.cmd("Copilot disable") -- Start with Copilot disabled
          end,
          enabled = false,
        }, -- or zbirenbaum/copilot.lua
        { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
      },
      build = "make tiktoken", -- Only on MacOS or Linux
      opts = {
        window = {
          layout = "horizontal",
          height = 0.4,
        },
        mappings = { complete = { insert = 'Tab', }, },
      },
    },

    { -- LSP Plugins
      -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
      -- used for completion, annotations and signatures of Neovim apis
      'folke/lazydev.nvim',
      ft = 'lua',
      opts = {
        library = {
          -- Load luvit types when the `vim.uv` word is found
          { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        },
      },
    },

    {
      -- Main LSP Configuration
      'neovim/nvim-lspconfig',
      dependencies = {
        { 'mason-org/mason.nvim', opts = {} },
        'mason-org/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        { 'j-hui/fidget.nvim', opts = {} },
        'saghen/blink.cmp',
      },
    },

    { -- Main LSP Configuration
      'neovim/nvim-lspconfig',
      dependencies = {
        -- Automatically install LSPs and related tools to stdpath for Neovim
        -- Mason must be loaded before its dependents so we need to set it up here.
        -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
        { 'mason-org/mason.nvim', opts = {} },
        'mason-org/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',

        -- Useful status updates for LSP.
        { 'j-hui/fidget.nvim', opts = {} },

        -- Allows extra capabilities provided by blink.cmp
        'saghen/blink.cmp',
      },
      config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
          group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
          callback = function(event)
            local map = function(keys, func, desc, mode)
              mode = mode or 'n'
              vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
            end

            -- Rename the variable under your cursor.
            --  Most Language Servers support renaming across files, etc.
            map('lrn', vim.lsp.buf.rename, '[R]e[n]ame')

            -- Execute a code action, usually your cursor needs to be on top of an error
            -- or a suggestion from your LSP for this to activate.
            map('lga', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

            -- Find references for the word under your cursor.
            map('lrr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

            -- Jump to the implementation of the word under your cursor.
            --  Useful when your language has ways of declaring types without an actual implementation.
            map('lgi', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

            -- Jump to the definition of the word under your cursor.
            --  This is where a variable was first declared, or where a function is defined, etc.
            --  To jump back, press <C-t>.
            map('lgd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

            -- WARN: This is not Goto Definition, this is Goto Declaration.
            --  For example, in C this would take you to the header.
            map('lgD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

            -- Fuzzy find all the symbols in your current document.
            --  Symbols are things like variables, functions, types, etc.
            map('lO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')

            -- Fuzzy find all the symbols in your current workspace.
            --  Similar to document symbols, except searches over your entire project.
            map('lW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')

            -- Jump to the type of the word under your cursor.
            --  Useful when you're not sure what type a variable is and you want to see
            --  the definition of its *type*, not where it was *defined*.
            map('lgt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

          end,
        })

        local capabilities = require('blink.cmp').get_lsp_capabilities()
        local servers = { lua_ls = { settings = { Lua = { completion = { callSnippet = 'Replace', }, }, }, }, }

        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
          'stylua', -- Used to format Lua code
        })
        require('mason-tool-installer').setup { ensure_installed = ensure_installed }

        require('mason-lspconfig').setup {
          ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
          automatic_installation = false,
          handlers = {
            function(server_name)
              local server = servers[server_name] or {}
              server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
              require('lspconfig')[server_name].setup(server)
            end,
          },
        }
      end,
    },

    { -- Adds git related signs to the gutter, as well as utilities for managing changes
      'lewis6991/gitsigns.nvim',
      opts = {
        signs = {
          add =          { text = '+' },
          change =       { text = '~' },
          delete =       { text = '_' },
          topdelete =    { text = '-' },
          changedelete = { text = '~' },
        },
        signs_staged = {
            add =          { text = '|' },
            change =       { text = '~' },
            delete =       { text = '_' },
            topdelete =    { text = '-' },
            changedelete = { text = '~' },
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          vim.keymap.set('n', '<leader>gs', gs.stage_hunk, { buffer = bufnr, desc = "[G]it [S]tage Hunk" })
          vim.keymap.set('n', '<leader>gu', gs.undo_stage_hunk, { buffer = bufnr, desc = "[G]it [U]ndo Stage Hunk" })
          vim.keymap.set('n', '<leader>gr', gs.reset_hunk, { buffer = bufnr, desc = "[G]it [R]eset Hunk" })
          vim.keymap.set('n', '<leader>gp', gs.preview_hunk, { buffer = bufnr, desc = "[G]it [P]review Hunk" })
        end,
      },
    },

    {
      "kdheepak/lazygit.nvim",
      lazy = true,
      cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
      },
      dependencies = { "nvim-lua/plenary.nvim", },
      keys = { { "<leader>glg", "<cmd>LazyGit<cr>", desc = "[G]it [L]azy[G]it" } },
    },

    -----------------
    -- EOF plugins --
    -----------------
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "catppuccin" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-----------
-- Theme --
-----------
function ColorMyPencils(color)
  color = color or "catppuccin-mocha"
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
end
ColorMyPencils()

----------------------
-- General settings --
----------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Make copy-paste less of a hassle
vim.o.clipboard = "unnamedplus"

vim.o.expandtab = true   -- Use spaces instead of tabs
vim.o.shiftwidth = 2     -- Number of spaces per indentation
vim.o.tabstop = 4        -- Number of spaces per tab
vim.o.smartindent = true -- Smart auto-indenting
vim.o.autoindent = true  -- Copy indent from current line when starting new one

-- Set line numbers
vim.o.number = true

-- Enable break indent
vim.o.breakindent = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Always show the gutter
vim.o.signcolumn = "yes"

-- Show which line your cursor is on
vim.o.cursorline = true

-- Display certain whitespace characters
vim.o.list = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

---------------------
-- Custom commands --
---------------------

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.filetype.add({
  extension = {
    sqlx = "sql",
  },
})

----------------------
-- Special Keybinds --
----------------------

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

---------------------
-- Leader Keybinds --
---------------------
local wk = require("which-key")

local function keymap_set(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs)
  wk.add({ { lhs, desc = desc } })
end

keymap_set("n", "<leader>fn", vim.cmd.Ex, "[F]ile Explore with [N]etrw")

keymap_set("n", "<leader>tp", vim.cmd.tabp, "[T]ab [P]revious")
keymap_set("n", "<leader>tn", vim.cmd.tabn, "[T]ab [N]ext")
keymap_set("n", "<leader>tc", vim.cmd.tabnew, "[T]ab [C]reate")
keymap_set("n", "<leader>tq", vim.cmd.tabclose, "[T]ab [Q]uit")

keymap_set("n", "<leader>cpc", "<cmd>CopilotChatToggle<CR>", "[C]o[P]ilot [C]hat")
vim.keymap.set("n", "<leader>cpt", function()
  local enabled = vim.fn.exists("*copilot#Enabled") == 1 and vim.fn["copilot#Enabled"]() or nil
  if enabled == 1 then
    vim.cmd("Copilot disable")
  elseif enabled == 0 then
    vim.cmd("Copilot enable")
  else
    print("Invalid Copilot status: " .. tostring(enabled))
  end
end, { desc = "[C]o[P]ilot [T]oggle" })

keymap_set("n", "<leader>-", vim.cmd.vsplit, "Vertical split")
keymap_set("n", "<leader>_", vim.cmd.split, "Horizontal split") 
