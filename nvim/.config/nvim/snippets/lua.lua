---@diagnostic disable:undefined-global
return {
  s('td', fmt('-- TODO: {}', { i(0, '...') })),
  s('p', fmt('vim.pretty_print({})', { i(0) })),
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
}
