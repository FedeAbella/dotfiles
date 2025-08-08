local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

return {
  s(
    {
      trig = "mockwire",
      desc = "Jest mock for apex wire",
      snippetType = "autosnippet",
    },
    fmta(
      [[
        jest.mock(
          "@salesforce/apex/[].[]",
          () => {
            const { createApexTestWireAdapter } = require("@salesforce/sfdx-lwc-jest");
            return {
              default: createApexTestWireAdapter(jest.fn())
            };
          },
          { virtual: true }
        );
      ]],
      {
        i(1, "className"),
        i(2, "methodName"),
      },
      {
        delimiters = "[]",
      }
    )
  ),
  s(
    {
      trig = "mockapex",
      desc = "Jest mock for apex imperative method",
      snippetType = "autosnippet",
    },
    fmta(
      [[
        jest.mock(
          "@salesforce/apex/[].[]",
          () => {
            return { default: jest.fn() };
          },
          { virtual: true }
        );
      ]],
      {
        i(1, "className"),
        i(2, "methodName"),
      },
      {
        delimiters = "[]",
      }
    )
  ),
  s({
    trig = "mockcomp",
    desc = "Jest mock a LWC",
    snippetType = "autosnippet",
  }, fmta([[jest.mock("c/<>")]], { i(1, "componentName") })),
}
