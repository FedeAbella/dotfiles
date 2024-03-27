return {
    "nvimtools/none-ls.nvim",
    config = function()
        -- Sets a default apex ruleset path if the project doesn't have one
        local default_apex_ruleset = vim.env.HOME .. "/.local/bin/pmd-bin-7.0.0/rulesets/apex.xml"
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.diagnostics.pmd.with({
                    -- This overwrites the default args so pmd is not called on the entire project
                    args = function(params)
                        return {
                            "--format",
                            "json",
                            "--dir",
                            -- Call pmd only on the current buffer and not the entire directory
                            vim.api.nvim_buf_get_name(params.bufnr),
                        }
                    end,
                    -- This are extra args besides the default overwritten ones
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
                            "--no-progress"
                        }
                    end,
                    env = function(params)
                        return { PMD_APEX_ROOT_DIRECTORY = params.cwd }
                    end,
                    -- This requires having set up filetypes for apex and assigning file extensions
                    -- This is done in sets.lua
                    filetypes = { "apex" },
                }),
            },
        })
    end,
}
