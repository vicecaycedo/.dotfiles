---@diagnostic disable:undefined-global
return {
  s('td', fmt('# TODO({}): {}', { i(1, 'vicentecaycedo'), i(0, '...') })),
  s('log', t('"//third_party/py/absl/logging",')),
  s('pudb', t('"//third_party/py/pudb",  # build-cleaner: keep')),
}
