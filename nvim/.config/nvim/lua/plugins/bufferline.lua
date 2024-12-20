return {
  'akinsho/bufferline.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
  keys = {
    { '<Left>', '<Cmd>BufferLineCyclePrev<CR>', desc = 'prev buffer' },
    { '<Right>', '<Cmd>BufferLineCycleNext<CR>', desc = 'next buffer' },
    {
      '<Leader><Left>',
      '<Cmd>BufferLineMovePrev<CR>',
      desc = 'move buffer left',
    },
    {
      '<Leader><Right>',
      '<Cmd>BufferLineMoveNext<CR>',
      desc = 'move buffer right',
    },
  },
  config = function()
    -- Configure Bufferline.
    local bufferline = require('bufferline')
    bufferline.setup({
      options = {
        custom_filter = function(buf_number)
          local buftype = vim.bo[buf_number].buftype
          return buftype ~= 'quickfix'
        end,
        diagnostics = 'nvim_lsp',
        show_buffer_close_icons = false,
        style_preset = bufferline.style_preset.no_italic,
      },
    })
    -- Set highlights.
    vim.api.nvim_set_hl(0, 'BufferLineFill', { bg = '#1f1f1f' })
  end,
}
