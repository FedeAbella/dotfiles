-- Whitespace chars
vim.opt.listchars =
    { eol = "↲", tab = "▸-", space = "·", nbsp = "␣", trail = "+", extends = "→", precedes = "←" } -- Whitespace characters

-- Line numbering
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Use relative line numbers
vim.opt.cursorline = true -- Show cursor line
vim.opt.cursorlineopt = "both" -- Highlight both cursor line and line number

-- Formatting
vim.opt.expandtab = true -- Use spaces when inserting tabs
vim.opt.shiftwidth = 4 -- Number of spaces inserted instead of tabs
vim.opt.smartindent = true -- Use smart indentation
vim.opt.syntax = "ON" -- Set syntax highlighting according to filetype

-- Interface
vim.o.termguicolors = true -- Enable 24 bit colors
vim.opt.showmode = false -- Don't show mode in line at bottom
vim.opt.splitright = true -- Split to the right when using vsplit
vim.opt.splitbelow = true -- Split to the bottom when using split
vim.opt.timeout = false -- Don't timeout when waiting for keystrokes
vim.opt.scrolloff = 8 -- Always keep at least 8 lines before and after cursor

-- Filetypes
vim.filetype = on
vim.filetype.plugin = on

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
})
