return {
  'folke/which-key.nvim',
  config = function()
    -- Shorten timeoutlen to display WhichKey faster.
    vim.o.timeoutlen = 400

    -- Set up WhichKey.
    local wk = require('which-key')
    wk.setup({
      plugins = {
        presets = {
          motions = false,
          operators = false,
          text_objects = false,
        },
      },
      show_help = false,
    })
  end,
}
