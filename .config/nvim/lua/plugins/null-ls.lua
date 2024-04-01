return {
    "nvimtools/none-ls.nvim",
    config = function()
        -- Sets a default apex ruleset path if the project doesn't have one
        local default_apex_ruleset = vim.env.HOME .. "/.local/bin/pmd-bin-7.0.0/rulesets/apex.xml"
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        local null_ls = require("null-ls")
        null_ls.setup({
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                            -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end
            end,
            sources = {
                -- Code Actions
                null_ls.builtins.code_actions.gitsigns,   -- Actions for git hunks
                -- Diagnostics
                null_ls.builtins.diagnostics.actionlint,  -- Github actions linter
                null_ls.builtins.diagnostics.gitlint,     -- Git commit linter
                null_ls.builtins.diagnostics.trail_space, -- Trailing whitespace for all filetypes
                null_ls.builtins.diagnostics.pmd.with({
                    -- This requires having set up filetypes for apex and assigning file extensions
                    -- This is done in sets.lua
                    filetypes = { "apex" },
                    -- This overwrites the default args so pmd is not called on the entire project,
                    -- while adding extra args in the same function
                    args = function(params)
                        -- Try using a local ruleset in .pmd/rulesets/apex.xml, or default one
                        local project_apex_ruleset = params.cwd .. "/.pmd/rulesets/apex.xml"
                        local ruleset
                        if vim.fn.filereadable(project_apex_ruleset) == 1 then
                            ruleset = project_apex_ruleset
                        else
                            ruleset = default_apex_ruleset
                        end
                        return {
                            "--format",
                            "json",
                            "--dir",
                            -- Call pmd only on the current buffer and not the entire directory
                            vim.api.nvim_buf_get_name(params.bufnr),
                            "--rulesets",
                            ruleset,
                            "--no-cache",
                            "--no-progress",
                        }
                    end,
                    env = function(params)
                        return { PMD_APEX_ROOT_DIRECTORY = params.cwd }
                    end,
                }),
                -- Formatting
                --                null_ls.builtins.formatting.stylua.with({
                --                    extra_args = { "--respect-ignores" },
                --                }),
                null_ls.builtins.formatting.prettier.with({
                    extra_filetypes = { "apex" },
                }),
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.shfmt.with({
                    extra_args = {
                        "--indent",
                        4
                    }
                }),
            },
        })
    end,
    commander = {
        {
            keys = { "n", "<leader>]" },
            cmd = [[<cmd>lua vim.lsp.buf.format()<cr>]],
            desc = "Format file",
        },
    },
}
