---@diagnostic disable:undefined-global
return {
  s('td', fmt('# TODO({}): {}', { i(1, 'vicentecaycedo'), i(0, '...') })),
  s(
    { trig = 'bp', dscr = 'Add breakpoint' },
    fmt(
      [[
        # TODO(vicentecaycedo): DO_NOT_SUBMIT - Remove debugging.
        breakpoint()
      ]],
      {}
    )
  ),
}
