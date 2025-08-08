local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

return {
  s(
    {
      trig = "testmethod",
      desc = "Apex Test Method",
      docstring = "Template for Apex Test method",
      snippetType = "autosnippet",
    },
    fmta(
      [[
        @IsTest
        static void <>() {
            <>
        }
      ]],
      {
        i(1, "methodName"),
        i(0),
      }
    )
  ),
  s(
    {
      trig = "testclass",
      desc = "Apex Test Class",
      docstring = "Template for Apex Test class",
      snippetType = "autosnippet",
    },
    fmta(
      [[
        @IsTest
        private class <> {
            @TestSetup
            private static setup() {
                <>
            }

            @IsTest
            private static void testMethod() {}
        }
      ]],
      {
        i(1, "className"),
        i(0),
      }
    )
  ),
  s(
    {
      trig = "testsetup",
      desc = "Apex Test Setup",
      docstring = "Template for Apex Test setup method",
      snippetType = "autosnippet",
    },
    fmta(
      [[
        @TestSetup
        static void setup() {
            <>
        }
      ]],
      {
        i(0),
      }
    )
  ),
}
