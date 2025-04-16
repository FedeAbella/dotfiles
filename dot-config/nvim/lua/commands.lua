-- Create custom commands --
require("lib/misc")

vim.api.nvim_create_user_command("Log", Log, { range = true })
