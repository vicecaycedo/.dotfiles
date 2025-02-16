return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<Leader>te', '<Cmd>Oil<CR>', desc = 'open file explorer' },
    },
    opts = {
      keymaps = {
        ['<BS>'] = 'actions.parent',
        ['<Esc>'] = 'actions.close',
      },
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name, _)
          return name == '..'
        end,
      },
    },
  },
}
