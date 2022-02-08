require('bufferline').setup({
  highlights = {
    fill = {
      guibg = '#1d2021',
    },
  },
  options = {
    diagnostics = 'nvim_lsp',
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'File Explorer',
        highlight = 'Directory',
      },
    },
    show_buffer_close_icons = false,
    show_close_icon = false,
  },
})
