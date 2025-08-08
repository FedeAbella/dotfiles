local ls = require("luasnip")
local fmta = require("luasnip.extras.fmt").fmta
local s = ls.snippet
local i = ls.insert_node

return {
  s(
    {
      trig = "console",
      desc = "console.log",
      docstring = "console.log() method",
    },
    fmta(
      [[
        console.log("<>: ", <>);
      ]],
      { i(1, "description"), i(2, "var") }
    )
  ),
  s(
    {
      trig = "jsonconsole",
      desc = "console.log JSON stringified object",
      docstring = { "console.log() method with", "JSON stringified variable" },
    },
    fmta(
      [[
        console.log("<>: ", JSON.stringify(<>));
      ]],
      {
        i(1, "describe"),
        i(2, "var"),
      }
    )
  ),
}
