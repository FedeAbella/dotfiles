return {
    "FedeAbella/sf.nvim",
    name = "sf.nvim",
    branch = "dev",
    dev = true,

    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim",
    },

    config = function()
        require("sf").setup({
            -- Disable hotkey automatic creation since I want to create my own.
            -- Unfortunately, this disables commands too, and must be recreated.
            hotkeys_in_filetypes = {},
        }) -- important to call setup() to init the plugin!

        vim.api.nvim_create_user_command("SfFetchOrgList", function()
            require("sf").fetch_org_list()
        end, {})

        vim.api.nvim_create_user_command("SfSetTargetOrg", function()
            require("sf").set_target_org()
        end, {})

        vim.api.nvim_create_user_command("SfDiff", function()
            require("sf").diff_in_target_org()
        end, {})

        vim.api.nvim_create_user_command("SfDiffInOrg", function()
            require("sf").diff_in_org()
        end, {})

        vim.api.nvim_create_user_command("SfListMdToRetrieve", function()
            require("sf").list_md_to_retrieve()
        end, {})

        vim.api.nvim_create_user_command("SfPullAndListMd", function()
            require("sf").pull_and_list_md()
        end, {})

        vim.api.nvim_create_user_command("SfListMdTypeToRetrieve", function()
            require("sf").list_md_type_to_retrieve()
        end, {})

        vim.api.nvim_create_user_command("SfPullAndListMdType", function()
            require("sf").pull_and_list_md_type()
        end, {})

        vim.api.nvim_create_user_command("SfToggle", function()
            require("sf").toggle_term()
        end, {})

        vim.api.nvim_create_user_command("SfSaveAndPush", function()
            require("sf").save_and_push()
        end, {})

        vim.api.nvim_create_user_command("SfRetrieve", function()
            require("sf").retrieve()
        end, {})

        vim.api.nvim_create_user_command("SfCancelCommand", function()
            require("sf").cancel()
        end, {})

        vim.api.nvim_create_user_command("SfRunAllTestsInThisFile", function()
            require("sf").run_all_tests_in_this_file()
        end, {})

        vim.api.nvim_create_user_command("SfRunCurrentTest", function()
            require("sf").run_current_test()
        end, {})

        vim.api.nvim_create_user_command("SfRepeatTest", function()
            require("sf").repeat_last_tests()
        end, {})

        vim.api.nvim_create_user_command("SfOpenTestSelect", function()
            require("sf").open_test_select()
        end, {})

        vim.api.nvim_create_user_command("SfRetrievePackage", function()
            require("sf").retrieve_package()
        end, {})

        vim.api.nvim_create_user_command("SfRunAnonymousApex", function()
            require("sf").run_anonymous()
        end, {})

        vim.api.nvim_create_user_command("SfRunQuery", function()
            require("sf").run_query()
        end, {})

        vim.api.nvim_create_user_command("SfRunToolingQuery", function()
            require("sf").run_tooling_query()
        end, {})

        vim.api.nvim_create_user_command("SfRunLocalTests", function()
            require("sf").run_local_tests()
        end, {})

        vim.api.nvim_create_user_command("SfCreateApexClass", function()
            require("sf").create_apex_class()
        end, {})

        vim.api.nvim_create_user_command("SfCreateAuraBundle", function()
            require("sf").create_aura_bundle()
        end, {})

        vim.api.nvim_create_user_command("SfCreateLwcBundle", function()
            require("sf").create_lwc_bundle()
        end, {})

        -- These are additional Salesforce related commands that don't use
        -- sf.nvim, but make sense to have them created here.
        vim.api.nvim_create_user_command(
            "SfJestRunAll",
            [[TermExec direction=float cmd="npm run test:unit:coverage"]],
            {}
        )

        vim.api.nvim_create_user_command("SfJestRunFile", function()
            if vim.fn.expand("%"):match("(.*)%.test%.js$") == nil then
                vim.notify("Not in a jest test file", vim.log.levels.ERROR)
                return
            end
            require("toggleterm").exec_command(
                string.format([[direction=float cmd="npm run test:unit -- -- %s"]], vim.fn.expand("%"))
            )
        end, {})
    end,
    commander = {
        {
            keys = { "n", "<leader>sog" },
            cmd = [[<cmd>lua require'sf'.fetch_org_list()<cr>]],
            desc = "Salesforce: Get Orgs",
        },
        {
            keys = { "n", "<leader>sos" },
            cmd = [[<cmd>lua require'sf'.set_target_org()<cr>]],
            desc = "Salesforce: Set Target Org",
        },
        {
            keys = { "n", "<leader>ss" },
            cmd = [[<cmd>lua require'sf'.toggle_term()<cr>]],
            desc = "Salesforce: Toggle Terminal",
        },
        {
            keys = { "n", "<leader>sfd" },
            cmd = [[<cmd>lua require'sf'.diff_in_target_org()<cr>]],
            desc = "Salesforce: Diff file against org",
        },
        {
            keys = { "n", "<leader>sfp" },
            cmd = [[<cmd>lua require'sf'.save_and_push()<cr>]],
            desc = "Salesforce: Save and push",
        },
        {
            keys = { "n", "<leader>sfr" },
            cmd = [[<cmd>lua require'sf'.retrieve()<cr>]],
            desc = "Salesforce: Retrieve file",
        },
        {
            keys = { "n", "<leader>sfq" },
            cmd = [[<cmd>lua require'sf'.run_query()<cr>]],
            desc = "Salesforce: Run Query in File",
        },
        {
            keys = { "n", "<leader>sftq" },
            cmd = [[<cmd>lua require'sf'.run_tooling_query()<cr>]],
            desc = "Salesforce: Run Tooling Query in File",
        },
        {
            keys = { "n", "<leader>sfa" },
            cmd = [[<cmd>lua require'sf'.run_anonymous()<cr>]],
            desc = "Salesforce: Run file as Anononymous Apex",
        },
        {
            keys = { "n", "<leader>spr" },
            cmd = [[<cmd>lua require'sf'.retrieve_package()<cr>]],
            desc = "Salesforce: Retrieve package",
        },
        {
            keys = { "n", "<leader>smr" },
            cmd = [[<cmd>lua require'sf'.list_md_to_retrieve()<cr>]],
            desc = "Salesforce: Retrieve Metadata",
        },
        {
            keys = { "n", "<leader>sgc" },
            cmd = [[<cmd>lua require'sf'.create_apex_class()<cr>]],
            desc = "Salesforce: Create Apex Class",
        },
        {
            keys = { "n", "<leader>sga" },
            cmd = [[<cmd>lua require'sf'.create_aura_bundle()<cr>]],
            desc = "Salesforce: Create Aura Bundle",
        },
        {
            keys = { "n", "<leader>sgl" },
            cmd = [[<cmd>lua require'sf'.create_lwc_bundle()<cr>]],
            desc = "Salesforce: Create LWC Bundle",
        },
        {
            keys = { "n", "<leader>stm" },
            cmd = [[<cmd>lua require'sf'.run_current_test()<cr>]],
            desc = "Salesforce: Run Test Method",
        },
        {
            keys = { "n", "<leader>stf" },
            cmd = [[<cmd>lua require'sf'.run_all_tests_in_this_file()<cr>]],
            desc = "Salesforce: Run Test File",
        },
        {
            keys = { "n", "<leader>str" },
            cmd = [[<cmd>lua require'sf'.repeat_last_tests()<cr>]],
            desc = "Salesforce: Repeat last test run",
        },
        {
            keys = { "n", "<leader>sta" },
            cmd = [[<cmd>lua require'sf'.run_local_tests()<cr>]],
            desc = "Salesforce: Run all Local Tests",
        },
        {
            keys = { "n", "<leader>sja" },
            cmd = [[<cmd>SfJestRunAll<cr>]],
            desc = "Salesforce: Run all Jest Tests",
        },
        {
            keys = { "n", "<leader>sjf" },
            cmd = [[<cmd>SfJestRunFile<cr>]],
            desc = "Salesforce: Run Jest Tests in current file",
        },
    },
}
