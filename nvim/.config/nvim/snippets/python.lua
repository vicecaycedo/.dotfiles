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
  s(
    { trig = 'pudb', dscr = 'Add pudb' },
    fmt(
      [[
        # TODO(vicentecaycedo): DO_NOT_SUBMIT - Remove debugging.
        import pudb; pudb.set_trace()  # pylint: disable=g-import-not-at-top, multiple-statements, line-too-long
      ]],
      {}
    )
  ),
  s(
    { trig = 'log', dscr = 'Add logging' },
    fmt(
      [[
        # TODO(vicentecaycedo): DO_NOT_SUBMIT - Remove logging.
        from absl import logging  # pylint: disable=g-import-not-at-top
        logging.info({})
      ]],
      { i(0) }
    )
  ),
}
