return {
    "nvimtools/none-ls.nvim",
    config = function()
        -- Sets a default apex ruleset path if the project doesn't have one
        local default_apex_ruleset = vim.env.HOME .. "/.local/bin/pmd-6.55.0/rulesets/apex.xml"
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.diagnostics.pmd.with({
                    args = function(params)
                        return {
                            "--format",
                            "json",
                            "--dir",
                            -- Call pmd only on the current buffer and not the entire directory
                            vim.api.nvim_buf_get_name(params.bufnr),
                        }
                    end,
                    extra_args = function(params)
                        -- Try using a local ruleset in .pmd/rulesets/apex.xml, or default one
                        local project_apex_ruleset = params.cwd .. "/.pmd/rulesets/apex.xml"
                        local ruleset
                        if vim.fn.filereadable(project_apex_ruleset) == 1 then
                            ruleset = project_apex_ruleset
                        else
                            ruleset = default_apex_ruleset
                        end
                        return {
                            "--rulesets",
                            ruleset,
                            "--no-cache",
                        }
                    end,
                    -- This requires having set up filetypes for apex and assigning file extensions
                    -- This is done in sets.lua
                    filetypes = { "apex" },
                }),
            },
        })
    end,
}
