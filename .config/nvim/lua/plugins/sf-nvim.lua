return {
    "xixiaofinland/sf.nvim",
    name = "sf.nvim",
    branch = "main",
    dev = false,
    lazy = false,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "ibhagwan/fzf-lua",
    },

    config = function()
        require("sf").setup({
            enable_hotkeys = false,
            types_to_retrieve = {
                "ApexClass",
                "ApexTrigger",
                "AuraDefinitionBundle",
                "ConnectedApp",
                "CustomApplication",
                "CustomField",
                "CustomMetadata",
                "CustomObject",
                "CustomPermission",
                "CustomTab",
                "ExperienceBundle",
                "ExternalCredential",
                "FlexiPage",
                "FlowDefinition",
                "Flow",
                "Layout",
                "LightningComponentBundle",
                "LightningMessageChannel",
                "NamedCredential",
                "OmniDataTransform",
                "OmniIntegrationProcedure",
                "PermissionSetGroup",
                "PermissionSet",
                "Profile",
                "QuickAction",
                "RecordType",
                "Role",
                "Settings",
                "SharingCriteriaRule",
                "SharingOwnerRule",
                "StaticResource",
            },
            term_config = {
                dimensions = {
                    height = 0.6,
                    width = 0.9,
                    y = 0.5,
                },
            },
            plugin_folder_name = "/.sf/sf_cache/",
        }) -- important to call setup() to init the plugin!

        -- These are additional Salesforce related commands that don't use
        -- sf.nvim, but make sense to have them created here.
        vim.api.nvim_create_user_command("SfJestRunAll", [[8TermExec name=Jest cmd="npm run test:unit:coverage"]], {})
        vim.api.nvim_create_user_command("SfJestRunFile", function()
            if vim.fn.expand("%"):match("(.*)%.test%.js$") == nil then
                vim.notify("Not in a jest test file", vim.log.levels.ERROR)
                return
            end
            require("toggleterm").exec_command(
                string.format([[name=Jest cmd="npm run test:unit -- -- %s"]], vim.fn.expand("%")),
                8
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
            keys = { "v", "<leader>sfr" },
            cmd = [[<cmd>lua require'sf'.retrieve_apex_under_cursor()<cr>]],
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
            keys = { "n", "<leader>scc" },
            cmd = [[<cmd>lua require'sf'.create_apex_class()<cr>]],
            desc = "Salesforce: Create Apex Class",
        },
        {
            keys = { "n", "<leader>sca" },
            cmd = [[<cmd>lua require'sf'.create_aura_bundle()<cr>]],
            desc = "Salesforce: Create Aura Bundle",
        },
        {
            keys = { "n", "<leader>scl" },
            cmd = [[<cmd>lua require'sf'.create_lwc_bundle()<cr>]],
            desc = "Salesforce: Create LWC Bundle",
        },
        {
            keys = { "n", "<leader>stm" },
            cmd = [[<cmd>lua require'sf'.run_current_test_with_coverage()<cr>]],
            desc = "Salesforce: Run Test Method",
        },
        {
            keys = { "n", "<leader>stf" },
            cmd = [[<cmd>lua require'sf'.run_all_tests_in_this_file_with_coverage()<cr>]],
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
