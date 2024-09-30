return {
  'hedyhli/outline.nvim',
  keys = {
    { '<Leader>fs', '<Cmd>Outline<CR>', desc = 'toggle outline' },
  },
  opts = {
    outline_window = {
      show_numbers = true,
      show_relative_numbers = true,
      width = 50,
    },
    symbol_folding = {
      autofold_depth = false,
    },
  },
}
