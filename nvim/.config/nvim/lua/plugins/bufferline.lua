return {
  'akinsho/bufferline.nvim',
  dependencies = { 'kyazdani42/nvim-web-devicons' },
  config = function()
    -- Set up Bufferline.
    require('bufferline').setup({
      options = {
        custom_filter = function(buf_number)
          return vim.api.nvim_buf_get_option(buf_number, 'buftype')
            ~= 'quickfix'
        end,
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
      highlights = {
        buffer_selected = { italic = false },
        diagnostic_selected = { italic = false },
        duplicate = { italic = false },
        duplicate_selected = { italic = false },
        duplicate_visible = { italic = false },
        error_diagnostic_selected = { italic = false },
        error_selected = { italic = false },
        hint_diagnostic_selected = { italic = false },
        hint_selected = { italic = false },
        info_diagnostic_selected = { italic = false },
        info_selected = { italic = false },
        numbers_selected = { italic = false },
        pick = { italic = false },
        pick_selected = { italic = false },
        pick_visible = { italic = false },
        warning_diagnostic_selected = { italic = false },
        warning_selected = { italic = false },
      },
    })

    -- Set keymaps.
    nmap('<Left>', '<Cmd>BufferLineCyclePrev<CR>', 'previous buffer')
    nmap('<Right>', '<Cmd>BufferLineCycleNext<CR>', 'next buffer')
    nmap('<Leader><Left>', '<Cmd>BufferLineMovePrev<CR>', 'move buffer left')
    nmap('<Leader><Right>', '<Cmd>BufferLineMoveNext<CR>', 'move buffer right')
  end,
}
