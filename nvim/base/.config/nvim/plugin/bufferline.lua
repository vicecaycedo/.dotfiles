vim.pack.add({
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/akinsho/bufferline.nvim',
})

local bufferline = require('bufferline')
bufferline.setup(
  ---@type bufferline.UserConfig
  {
    options = {
      custom_filter = function(bufnr)
        return vim.bo[bufnr].buftype ~= 'quickfix'
      end,
      diagnostics = 'nvim_lsp',
      show_buffer_close_icons = false,
      style_preset = bufferline.style_preset.no_italic,
    },
  }
)

local nmap = require('vc.keymap').nmap
nmap('<Left>', '<Cmd>BufferLineCyclePrev<CR>', 'prev buffer')
nmap('<Right>', '<Cmd>BufferLineCycleNext<CR>', 'next buffer')
nmap('<Leader><Left>', '<Cmd>BufferLineMovePrev<CR>', 'move buffer left')
nmap('<Leader><Right>', '<Cmd>BufferLineMoveNext<CR>', 'move buffer right')
