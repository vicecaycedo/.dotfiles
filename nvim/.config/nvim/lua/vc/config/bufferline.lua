require('bufferline').setup({
  highlights = {
    background = {
      guifg = '#d0d0d0',
    },
    fill = {
      guibg = '#1e1e1e',
    },
  },
  options = {
    diagnostics = 'nvim_lsp',
    show_buffer_close_icons = false,
    show_close_icon = false,
  },
})
