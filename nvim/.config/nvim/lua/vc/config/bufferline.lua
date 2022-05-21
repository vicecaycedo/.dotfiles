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
  -- Match Gruvbox theme.
  -- highlights = {
  --   fill = {
  --     guibg = '#1d2021',
  --   },
  -- },
  -- Match VSCode theme.
  highlights = {
    fill = {
      guifg = { attribute = 'fg', highlight = 'Normal' },
      guibg = { attribute = 'bg', highlight = 'StatusLineNC' },
    },
    background = {
      guifg = { attribute = 'fg', highlight = 'Normal' },
      guibg = { attribute = 'bg', highlight = 'StatusLine' },
    },
    buffer_visible = {
      guifg = { attribute = 'fg', highlight = 'Normal' },
      guibg = { attribute = 'bg', highlight = 'Normal' },
    },
    buffer_selected = {
      guifg = { attribute = 'fg', highlight = 'Normal' },
      guibg = { attribute = 'bg', highlight = 'Normal' },
    },
    separator = {
      guifg = { attribute = 'bg', highlight = 'Normal' },
      guibg = { attribute = 'bg', highlight = 'StatusLine' },
    },
    separator_selected = {
      guifg = { attribute = 'fg', highlight = 'Special' },
      guibg = { attribute = 'bg', highlight = 'Normal' },
    },
    separator_visible = {
      guifg = { attribute = 'fg', highlight = 'Normal' },
      guibg = { attribute = 'bg', highlight = 'StatusLineNC' },
    },
  },
})
