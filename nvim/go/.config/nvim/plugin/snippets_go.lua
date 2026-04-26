local luasnip = require('luasnip')
local s = luasnip.snippet
local i = luasnip.insert_node
local fmt = require('luasnip.extras.fmt').fmt

luasnip.add_snippets('go', {
  s('td', fmt('// TODO: {}', { i(0) })),
  s('p', fmt('fmt.Printf("%+v\\n", {})', { i(0) })),
})
