local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local c = ls.choice_node
local sn = ls.snippet_node
local fmta = require("luasnip.extras.fmt").fmta
local d = ls.dynamic_node
local t = ls.text_node
local rep = require("luasnip.extras").rep

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
      trig = "innerclass",
      desc = "Apex Inner Class",
      snippetType = "autosnippet",
    },
    fmta(
      [[
        <><> class <> {
            <>
        }
      ]],
      {
        d(3, function(args)
          if args[1][1] == "public" then
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
        end, 1),
        c(1, {
          t("public"),
          t("private"),
        }),
        i(2, "className"),
        i(0),
      }
    )
  ),
  s(
    {
      trig = "customexception",
      desc = "Custom Apex Exception",
      snippetType = "autosnippet",
    },
    fmta(
      [[
        <><> class <>Exception extends Exception {}
      ]],
      {
        d(3, function(args)
          if args[1][1] == "public" then
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
        end, 1),
        c(1, {
          t("public"),
          t("private"),
        }),
        i(2, "name"),
      }
    )
  ),
  s(
    {
      trig = "fortype",
      desc = "For loop over an Iterable",
      snippetType = "autosnippet",
    },
    fmta(
      [[
        for (<> <> : <>) {
            <>
        }
      ]],
      {
        i(1, "type"),
        i(2, "var"),
        i(3, "iterable"),
        i(0),
      }
    )
  ),
  s(
    {
      trig = "forind",
      desc = "For loop over an index",
      snippetType = "autosnippet",
    },
    fmta(
      [[
        for (Integer [] = 0; [] < []; []++) {
            []
        }
      ]],
      {
        i(1, "i"),
        rep(1),
        i(2, "iMax"),
        rep(1),
        i(),
      },
      {
        delimiters = "[]",
      }
    )
  ),
}
