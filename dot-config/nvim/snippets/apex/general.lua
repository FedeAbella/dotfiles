local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local sn = ls.snippet_node
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta

return {
  s({
    trig = "docstring",
    desc = "ApexDoc docstring",
    docstring = { "An ApexDoc formatted docstring", "for classes and methods" },
    snippetType = "autosnippet",
  }, {
    c(1, {
      sn(
        nil,
        fmta(
          [[
            /**
            * @description <>
             */
          ]],
          {
            i(1, "Class/Method description"),
          }
        )
      ),
      sn(
        nil,
        fmta(
          [[
            /**
            * @description <>
            * @param <> <>
             */
          ]],
          {
            i(1, "Class/Method description"),
            i(2, "name"),
            i(3, "description"),
          }
        )
      ),
      sn(
        nil,
        fmta(
          [[
            /**
            * @description <>
            * @return <>
             */
          ]],
          {
            i(1, "Class/Method description"),
            i(2, "description"),
          }
        )
      ),
      sn(
        nil,
        fmta(
          [[
            /**
            * @descrption <>
            * @param <> <>
            * @return <>
          ]],
          {
            i(1, "Class/Method description"),
            i(2, "name"),
            i(3, "descrition"),
            i(4, "description"),
          }
        )
      ),
    }),
  }),
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
  s(
    {
      trig = "auramethod",
      desc = "AuraEnabled Method",
      docstring = "Template for an AuraEnabled method",
      snippetType = "autosnippet",
    },
    fmta(
      [[
        @AuraEnabled
        public static <> <>(<>) {
            try {
                <>
            } catch (Exception e) {
                AuraHandledException auraExc = new AuraHandledException(e.getMessage());
                auraExc.setMessage(e.getMessage());
                throw auraExc;
            }
        }
      ]],
      {
        i(1, "returnType"),
        i(2, "methodName"),
        i(3, "params"),
        i(0),
      }
    )
  ),
  s(
    {
      trig = "auraprop",
      desc = "AuraEnabled Property",
      docstring = "Template for an AuraEnabled property",
      snippetType = "autosnippet",
    },
    fmta(
      [[
        <>@AuraEnabled
        <> <> <><>
      ]],
      {
        d(5, function(args)
          vim.print(args)
          if string.find(args[1][1], "get") or string.find(args[1][1], "set") then
            return sn(
              nil,
              fmta(
                [[
                  /**
                  * @description <>
                   */

                ]],
                { i(1, "description") }
              )
            )
          end
          return sn(nil, {})
        end, 4),
        i(1, "access"),
        i(2, "type"),
        i(3, "name"),
        c(4, {
          t(";"),
          t(" { get; set; }"),
        }),
      }
    )
  ),
}
