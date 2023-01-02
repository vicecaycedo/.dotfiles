return {
  'tpope/vim-abolish',
  cmd = { 'S', 'Subvert' },
  keys = 'cr',
  config = function()
    -- Register mappings with WhichKey.
    local loaded, wk = pcall(require, 'which-key')
    if loaded then
      wk.register({
        ['cr'] = {
          name = 'coerce',
          ['<Space>'] = 'to space case',
          ['.'] = 'to.dot.case',
          ['-'] = 'to-dash-case',
          c = 'toCamelCase',
          m = 'ToMixedCase',
          s = 'to_snake_case',
          u = 'TO_UPPER_SNAKE_CASE',
        },
      })
    end
  end,
}
