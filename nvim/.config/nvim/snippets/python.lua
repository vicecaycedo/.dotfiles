---@diagnostic disable:undefined-global
return {
  s('td', fmt('# TODO({}): {}', { i(1, 'vicentecaycedo'), i(0, '...') })),
  s(
    { trig = 'bp', dscr = 'Add debugging' },
    fmt(
      [[
        # TODO(vicentecaycedo): DO_NOT_SUBMIT - Remove debugging.
        import debugpy  # pylint: disable=g-import-not-at-top, g-bad-import-order
        debugpy.listen(('localhost', 5678))
        debugpy.wait_for_client()
        breakpoint()
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
