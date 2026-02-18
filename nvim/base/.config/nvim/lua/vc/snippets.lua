---@diagnostic disable:unused-local
local luasnip = require('luasnip')
local s = luasnip.snippet
local sn = luasnip.snippet_node
local t = luasnip.text_node
local i = luasnip.insert_node
local f = luasnip.function_node
local c = luasnip.choice_node
local d = luasnip.dynamic_node
local r = luasnip.restore_node
local l = require('luasnip.extras').lambda
local rep = require('luasnip.extras').rep
local p = require('luasnip.extras').partial
local m = require('luasnip.extras').match
local n = require('luasnip.extras').nonempty
local dl = require('luasnip.extras').dynamic_lambda
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local types = require('luasnip.util.types')
local conds = require('luasnip.extras.conditions')
local conds_expand = require('luasnip.extras.conditions.expand')
---@diagnostic enable:unused-local

luasnip.add_snippets('all', {
  s('vc', t('vicentecaycedo')),
})

luasnip.add_snippets('go', {
  s('td', fmt('// TODO: {}', { i(0, '...') })),
  s('p', fmt('fmt.Printf("%+v\\n", {})', { i(0) })),
})

luasnip.add_snippets('lua', {
  s('td', fmt('-- TODO: {}', { i(0, '...') })),
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
      { i(1, '<fName>'), i(2, '<args>'), i(0, '<fBody>') }
    )
  ),
})
