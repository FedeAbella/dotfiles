-- Set colorscheme
vim.cmd.colorscheme("catppuccin")

-- Override highlight groups
local mocha = require("catppuccin.palettes.mocha")
vim.api.nvim_set_hl(0, "OilDir", { fg = mocha.mauve })
vim.api.nvim_set_hl(0, "OilLink", { fg = mocha.peach })
vim.api.nvim_set_hl(0, "OilLinkTarget", { fg = mocha.rosewater })
vim.api.nvim_set_hl(0, "NvimSurroundHighlight", { fg = mocha.mantle, bg = mocha.sapphire })
