return {
  'folke/paint.nvim',
  event = 'BufReadPre',
  config = {
    highlights = {
      {
        filter = {},
        pattern = 'DO_NOT_SUBMIT',
        hl = 'ErrorMsg',
      },
    },
  },
}
