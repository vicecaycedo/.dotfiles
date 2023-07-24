return {
  'andrewradev/switch.vim',
  keys = {
    { '<Leader>-', '<Cmd>Switch<CR>', desc = 'Switch word under cursor' },
  },
  init = function()
    -- Disable default mapping.
    vim.g.switch_mapping = ''
  end,
}
