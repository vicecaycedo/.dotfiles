vim.pack.add({ 'https://github.com/folke/which-key.nvim' })

local wk = require('which-key')
wk.setup(
  ---@type wk.Opts
  {
    delay = 400,
    plugins = {
      presets = {
        motions = false,
        operators = false,
        text_objects = false,
      },
    },
    show_help = false,
    icons = {
      mappings = false,
    },
  }
)

wk.add({
  -- Register vim-sort-motion keys.
  { 'gs', group = 'sort' },

  -- Hide camelcasemotion keys.
  { '<Leader>e', hidden = true, mode = { 'n', 'x', 'o' } },
  { '<Leader>ge', hidden = true, mode = { 'n', 'x', 'o' } },
  { '<Leader>w', hidden = true, mode = { 'n', 'x', 'o' } },
})
