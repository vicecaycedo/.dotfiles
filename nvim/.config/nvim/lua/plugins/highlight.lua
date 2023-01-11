return {
  'folke/paint.nvim',
  event = 'BufReadPre',
  opts = {
    highlights = {
      {
        filter = {},
        pattern = 'DO_NOT_SUBMIT',
        hl = 'ErrorMsg',
      },
    },
  },
}
