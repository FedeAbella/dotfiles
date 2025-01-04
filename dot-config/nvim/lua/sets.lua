-- Whitespace chars
vim.opt.listchars =
  { eol = "↲", tab = "▸-", space = "·", nbsp = "␣", trail = "+", extends = "→", precedes = "←" } -- Whitespace characters

-- Line numbering
vim.o.number = true -- Show line numbers
vim.o.relativenumber = true -- Use relative line numbers
vim.o.cursorline = true -- Show cursor line
vim.o.cursorlineopt = "both" -- Highlight both cursor line and line number

-- Formatting
vim.o.expandtab = true -- Use spaces when inserting tabs
vim.o.shiftwidth = 4 -- Number of spaces inserted instead of tabs
vim.o.smartindent = true -- Use smart indentation
vim.o.syntax = "ON" -- Set syntax highlighting according to filetype

-- Interface
vim.o.termguicolors = true -- Enable 24 bit colors
vim.o.showmode = false -- Don't show mode in line at bottom
vim.o.splitright = true -- Split to the right when using vsplit
vim.o.splitbelow = true -- Split to the bottom when using split
vim.o.timeout = false -- Don't timeout when waiting for keystrokes
vim.o.scrolloff = 8 -- Always keep at least 8 lines before and after cursor
vim.o.guifont = "Meslo LGS NF"

-- Filetypes
vim.filetype.add({
  extension = {
    cls = "apex",
    apex = "apex",
    trigger = "apex",
    soql = "soql",
    sosl = "sosl",
    zsh = "sh",
  },
  filename = {
    [".zshrc"] = "sh",
  },
  pattern = {
    [".*/hypr/.*%.conf"] = "hyprlang",
  },
})

-- Misc
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~") .. "/.config/nvim/undo-dir"
vim.opt.signcolumn = "yes"

-- Set the leader key
vim.g.mapleader = " "

-- Remove arrow keys while on insert mode
vim.api.nvim_set_keymap("i", "<Up>", "", {})
vim.api.nvim_set_keymap("i", "<Down>", "", {})
vim.api.nvim_set_keymap("i", "<S-Up>", "", {})
vim.api.nvim_set_keymap("i", "<S-Down>", "", {})
vim.api.nvim_set_keymap("i", "<Left>", "", {})
vim.api.nvim_set_keymap("i", "<Right>", "", {})
vim.api.nvim_set_keymap("i", "<S-Left>", "", {})
vim.api.nvim_set_keymap("i", "<S-Right>", "", {})
