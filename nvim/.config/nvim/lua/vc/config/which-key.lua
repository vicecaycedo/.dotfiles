local keys = require('which-key')
keys.setup({
  plugins = {
    presets = {
      g = false,
      motions = false,
      operators = false,
      text_objects = false,
    },
  },
  show_help = false,
})

-- Ignore plugin mappings.
keys.register({
  -- Vim-surround.
  ['cs'] = 'which_key_ignore',
  ['cS'] = 'which_key_ignore',
  ['ds'] = 'which_key_ignore',
  ['dS'] = 'which_key_ignore',
  ['ys'] = 'which_key_ignore',
  ['yS'] = 'which_key_ignore',
  -- Camelcasemotion.
  ['<leader>b'] = 'which_key_ignore',
  ['<leader>e'] = 'which_key_ignore',
  ['<leader>ge'] = 'which_key_ignore',
  ['<leader>w'] = 'which_key_ignore',
})

-- Label plugin mappings.
keys.register({
  -- Kommentary.
  ['gc'] = 'comment',
  -- Vim-abolish.
  ['cr'] = {
    name = 'coerce',
    ['<Space>'] = { 'to space case' },
    ['.'] = { 'to.dot.case' },
    ['-'] = { 'to-dash-case' },
    c = { 'toCamelCase' },
    m = { 'ToMixedCase' },
    s = { 'to_snake_case' },
    u = { 'TO_UPPER_SNAKE_CASE' },
  },
})
