return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  priority = 900,
  opts = function()
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.buttons.val = {
      dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("e", "󰦄  Explore", ":Oil --float .<CR>"),
      dashboard.button("f", "  Find file", ":Telescope find_files hidden=true no_ignore=true <CR>"),
      dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("r", "󰄉  Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("u", "󱐥  Update plugins", "<cmd>Lazy update<CR>"),
      dashboard.button("q", "󰿅  Quit", "<cmd>qa<CR>"),
    }

    dashboard.opts.opts.noautocmd = true

    -- helper function for utf8 chars
    local function getCharLen(s, pos)
      local byte = string.byte(s, pos)
      if not byte then
        return nil
      end
      return (byte < 0x80 and 1) or (byte < 0xE0 and 2) or (byte < 0xF0 and 3) or (byte < 0xF8 and 4) or 1
    end

    local function getGreeting(name)
      local tableTime = os.date("*t")
      local hour = tableTime.hour
      local greetingsTable = {
        [1] = "  Sleep well",
        [2] = "  Good morning",
        [3] = "  Good afternoon",
        [4] = "  Good evening",
        [5] = "󰖔  Good night",
      }
      local greetingIndex = 0
      if hour == 23 or hour < 7 then
        greetingIndex = 1
      elseif hour < 12 then
        greetingIndex = 2
      elseif hour >= 12 and hour < 18 then
        greetingIndex = 3
      elseif hour >= 18 and hour < 21 then
        greetingIndex = 4
      elseif hour >= 21 then
        greetingIndex = 5
      end
      return greetingsTable[greetingIndex] .. ", " .. name
    end

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      desc = "Add Alpha dashboard footer",
      once = true,
      callback = function()
        local stats = require("lazy").stats()
        local ms = string.format("%.2f", stats.startuptime)
        dashboard.section.footer.val = {
          "",
          os.date("  %A, %Y-%m-%d   %H:%M:%S"),
          "",
          getGreeting("Fede"),
          "",
          "  Loaded " .. stats.loaded .. " plugins   in " .. ms .. " ms ",
        }
        pcall(vim.cmd.AlphaRedraw)
      end,
    })

    local function applyColors(logo, colors, logoColors)
      dashboard.section.header.val = logo

      for key, color in pairs(colors) do
        local name = "Alpha" .. key
        vim.api.nvim_set_hl(0, name, color)
        colors[key] = name
      end

      dashboard.section.header.opts.hl = {}
      for i, line in ipairs(logoColors) do
        local highlights = {}
        local pos = 0

        for j = 1, #line do
          local opos = pos
          pos = pos + getCharLen(logo[i], opos + 1)

          local color_name = colors[line:sub(j, j)]
          if color_name then
            table.insert(highlights, { color_name, opos, pos })
          end
        end

        table.insert(dashboard.section.header.opts.hl, highlights)
      end
      return dashboard.opts
    end

    return applyColors({
      [[  ███       ███  ]],
      [[  ████      ████ ]],
      [[  ████     █████ ]],
      [[ █ ████    █████ ]],
      [[ ██ ████   █████ ]],
      [[ ███ ████  █████ ]],
      [[ ████ ████ ████ ]],
      [[ █████  ████████ ]],
      [[ █████   ███████ ]],
      [[ █████    ██████ ]],
      [[ █████     █████ ]],
      [[ ████      ████ ]],
      [[  ███       ███  ]],
      [[                    ]],
      [[  N  E  O  V  I  M  ]],
    }, {
      ["b"] = { fg = "#3399ff", ctermfg = 33 },
      ["a"] = { fg = "#53C670", ctermfg = 35 },
      ["g"] = { fg = "#39ac56", ctermfg = 29 },
      ["h"] = { fg = "#33994d", ctermfg = 23 },
      ["i"] = { fg = "#33994d", bg = "#39ac56", ctermfg = 23, ctermbg = 29 },
      ["j"] = { fg = "#53C670", bg = "#33994d", ctermfg = 35, ctermbg = 23 },
      ["k"] = { fg = "#30A572", ctermfg = 36 },
    }, {
      [[  kkkka       gggg  ]],
      [[  kkkkaa      ggggg ]],
      [[ b kkkaaa     ggggg ]],
      [[ bb kkaaaa    ggggg ]],
      [[ bbb kaaaaa   ggggg ]],
      [[ bbbb aaaaaa  ggggg ]],
      [[ bbbbb aaaaaa igggg ]],
      [[ bbbbb  aaaaaahiggg ]],
      [[ bbbbb   aaaaajhigg ]],
      [[ bbbbb    aaaaajhig ]],
      [[ bbbbb     aaaaajhi ]],
      [[ bbbbb      aaaaajh ]],
      [[  bbbb       aaaaa  ]],
      [[                    ]],
      [[  a  a  a  b  b  b  ]],
    })
  end,
}
