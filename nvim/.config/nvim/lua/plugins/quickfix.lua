return {
  'kevinhwang91/nvim-bqf',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  ft = 'qf',
  config = {
    func_map = {
      open = 'o',
      openc = '<CR>',
      pscrolldown = '<C-d>',
      pscrollup = '<C-u>',
      fzffilter = '', -- Disable fzf filter.
    },
  },
}
