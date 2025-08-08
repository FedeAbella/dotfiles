local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

return {
  s(
    {
      trig = "ternary",
      desc = "A ternary operator",
      docstring = "Ternary Operator: {1:cond} ? {2:then} : {3:else}",
    },
    fmta(
      [[
        <> ? <> : <>
      ]],
      {
        i(1, "cond"),
        i(2, "then"),
        i(3, "else"),
      }
    )
  ),
}
