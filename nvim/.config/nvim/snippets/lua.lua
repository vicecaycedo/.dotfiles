---@diagnostic disable:undefined-global
return {
  s(
    { trig = 'sn', dscr = 'Snippet boilerplate' },
    fmt(
      [=[
        s(
          {{ trig = '{}', dscr = '{}' }},
          fmt(
            [[
              {}
            ]],
            {{{}}}
          )
        ),
      ]=],
      { i(1, '<trig>'), i(2, '<description>'), i(3), i(0) }
    )
  ),
  s('td', fmt('-- TODO: {}', { i(0, '...') })),
  s('p', fmt('vim.pretty_print({})', { i(0) })),
  s('l', fmt('local {} = {}', { i(1), i(0) })),
  s('req', fmt("require('{}')", { i(0) })),
  s(
    { trig = 'lreq', dscr = 'Smart require' },
    fmt("local {} = require('{}')", {
      f(function(import_name)
        local parts = vim.split(import_name[1][1], '.', true)
        return parts[#parts] or ''
      end, 1),
      i(1, '<modName>'),
    })
  ),
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
}
