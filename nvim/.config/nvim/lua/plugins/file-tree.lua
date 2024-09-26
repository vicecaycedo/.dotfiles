return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<Leader>te', '<Cmd>Oil<CR>', desc = 'open file explorer' },
    },
    opts = {
      keymaps = {
        ['<Esc>'] = 'actions.close',
      },
    },
  },
}
