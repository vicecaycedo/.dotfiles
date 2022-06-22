local normal_guibg = { attribute = 'bg', highlight = 'Normal' }
local normal_guifg = { attribute = 'fg', highlight = 'Normal' }
local normal_highlight = { guibg = normal_guibg, guifg = normal_guifg }

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
      guibg = { attribute = 'bg', highlight = 'StatusLineNC' },
      guifg = normal_guifg,
    },
    background = {
      guibg = { attribute = 'bg', highlight = 'StatusLine' },
      guifg = normal_guifg,
    },
    buffer_visible = normal_highlight,
    buffer_selected = normal_highlight,
    separator = {
      guibg = { attribute = 'bg', highlight = 'StatusLine' },
      guifg = normal_guifg,
    },
    separator_selected = {
      guibg = normal_guibg,
      guifg = { attribute = 'fg', highlight = 'Special' },
    },
    separator_visible = {
      guibg = { attribute = 'bg', highlight = 'StatusLineNC' },
      guifg = normal_guifg,
    },
    duplicate = normal_highlight,
    duplicate_selected = normal_highlight,
    duplicate_visible = normal_highlight,
  },
})
