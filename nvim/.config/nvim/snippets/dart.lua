---@diagnostic disable:undefined-global
return {
  s('td', fmt('// TODO: {}', { i(0, '...') })),
  s('p', fmt("print('{}');", { i(0) })),
}
