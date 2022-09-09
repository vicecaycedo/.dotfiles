require('bufferline').setup({
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

vim.api.nvim_set_hl(0, 'BufferLineFill', { bg = '#161616' })
vim.api.nvim_set_hl(0, 'BufferLineIndicatorSelected', { fg = '#1e1e1e' })
vim.api.nvim_set_hl(
  0,
  'BufferLineBufferSelected',
  { bg = '#1e1e1e', fg = '#d4d4d4', bold = true }
)
vim.api.nvim_set_hl(
  0,
  'BufferLineInfoSelected',
  { bg = '#1e1e1e', fg = '#569cd6', bold = true }
)
vim.api.nvim_set_hl(
  0,
  'BufferLineHintSelected',
  { bg = '#1e1e1e', fg = '#4075a0', bold = true }
)
vim.api.nvim_set_hl(
  0,
  'BufferLineWarningSelected',
  { bg = '#1e1e1e', fg = '#dcdcaa', bold = true }
)
vim.api.nvim_set_hl(
  0,
  'BufferLineErrorSelected',
  { bg = '#1e1e1e', fg = '#f44747', bold = true }
)
