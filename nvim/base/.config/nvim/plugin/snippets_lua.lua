local luasnip = require('luasnip')
local s = luasnip.snippet
local i = luasnip.insert_node
local fmt = require('luasnip.extras.fmt').fmt

luasnip.add_snippets('lua', {
  s('td', fmt('-- TODO: {}', { i(0) })),
  s('p', fmt('vim.print({})', { i(0) })),
  s('req', fmt("require('{}'){}", { i(1), i(0) })),
  s(
    { trig = 'M', dscr = 'Module boilerplate' },
    fmt(
      [[
        local M = {{}}

        {}

        return M
      ]],
      { i(0) }
    )
  ),
  s(
    { trig = 'Mf', dscr = 'Module function' },
    fmt(
      [[
        M.{} = function({})
          {}
        end
      ]],
      { i(1), i(2), i(0) }
    )
  ),
})
