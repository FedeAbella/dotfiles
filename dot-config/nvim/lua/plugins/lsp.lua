return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("luasnip.loaders.from_lua").lazy_load({ paths = { "./snippets" } })
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
    commander = {
      {
        keys = { { "i", "s" }, "<C-f>", { silent = true } },
        cmd = [[<cmd>lua require'luasnip'.jump(1)<cr>]],
        desc = "LuaSnip: Jump forward",
        show = false,
      },
      {
        keys = { { "i", "s" }, "<C-b>", { silent = true } },
        cmd = [[<cmd>lua require'luasnip'.jump(-1)<cr>]],
        desc = "LuaSnip: Jump backwards",
        show = false,
      },
      {
        keys = { { "i", "s" }, "<C-E>", { silent = true } },
        cmd = function()
          if require("luasnip").choice_active() then
            require("luasnip").change_choice(1)
          end
        end,
        desc = "LuaSnip: Next Choice",
        show = false,
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = "InsertEnter",
    dependencies = {
      { "saadparwaiz1/cmp_luasnip" },
      { "onsails/lspkind.nvim" },
      { "hrsh7th/cmp-buffer" },
    },
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      cmp.setup({
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
            show_labelDetails = true,
            menu = {
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              luasnip = "[LuaSnip]",
              lazydev = "[LazyDev]",
              ["render-markdown"] = "[Markdown]",
            },
          }),
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = "lazydev" },
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "render-markdown" },
          { name = "buffer" },
        }),
        mapping = cmp.mapping.preset.insert({
          ["<M-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
          ["<M-j>"] = cmp.mapping.select_next_item(), -- next suggestion
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
        }),
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "williamboman/mason.nvim",
        lazy = false,
        opts = {
          ui = {
            border = "rounded",
          },
        },
      },
      { "williamboman/mason-lspconfig.nvim" },
      { "hrsh7th/cmp-nvim-lsp" },
    },
    config = function()
      local lsp_defaults = require("lspconfig").util.default_config
      lsp_defaults.capabilities =
        vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function(event)
          local opts = { buffer = event.buf }

          vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
          vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
          vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
          vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
          vim.keymap.set("n", "grr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
          vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
          vim.keymap.set("n", "grn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
          vim.keymap.set({ "n", "x" }, "g=", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
          vim.keymap.set("n", "gra", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
        end,
      })

      require("mason-lspconfig").setup({
        ensure_installed = {
          "apex_ls",
          "bashls",
          "cssls",
          "lwc_ls",
          "eslint",
          "ts_ls",
          "jsonls",
          "lua_ls",
          "marksman",
          "pylsp",
          "graphql",
          "sqlls",
          "visualforce_ls",
          "lemminx",
          "yamlls",
          "hyprls",
          "jedi_language_server",
        },
        automatic_installation = true,
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,
          apex_ls = function()
            require("lspconfig").apex_ls.setup({
              filetypes = { "apex" },
            })
          end,
          pylsp = function()
            require("lspconfig").pylsp.setup({
              settings = {
                pylsp = {
                  plugins = {
                    jedi_completion = {
                      enabled = false,
                      include_params = true,
                    },
                    rope_autoimport = {
                      enabled = true,
                    },
                  },
                },
              },
            })
          end,
          jedi_language_server = function()
            require("lspconfig").jedi_language_server.setup({
              init_options = {
                diagnostics = {
                  enable = false,
                },
              },
              on_init = function(client)
                client.server_capabilities.renameProvider = false
              end,
            })
          end,
        },
      })

      vim.diagnostic.config({
        update_in_insert = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "✘",
            [vim.diagnostic.severity.WARN] = "▲",
            [vim.diagnostic.severity.HINT] = "⚑",
            [vim.diagnostic.severity.INFO] = "»",
          },
        },
      })
    end,
  },
}
