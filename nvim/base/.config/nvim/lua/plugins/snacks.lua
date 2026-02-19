return {
  'folke/snacks.nvim',
  ---@type snacks.Config
  opts = {
    picker = {
      prompt = '> ',
      layout = {
        preset = 'vertical_large_preview',
      },
      layouts = {
        vertical_large_preview = {
          fullscreen = true,
          layout = {
            backdrop = false,
            box = 'vertical',
            border = 'rounded',
            title = '{title} {live} {flags}',
            title_pos = 'center',
            { win = 'input', height = 1, border = 'bottom' },
            { win = 'list', border = 'none' },
            {
              win = 'preview',
              title = '{preview}',
              height = 0.7,
              border = 'top',
            },
          },
        },
      },
    },
    image = {},
  },
  keys = {
    {
      '<Leader>pr',
      function()
        Snacks.picker.resume()
      end,
      desc = 'resume picker',
    },

    -- Diagnostics
    {
      '<Leader>D',
      function()
        Snacks.picker.diagnostics()
      end,
      desc = 'view all diagnostics',
    },
    {
      '<Leader>d',
      function()
        Snacks.picker.diagnostics_buffer()
      end,
      desc = 'view buffer diagnostics',
    },

    -- grep
    { '<Leader>fb', require('vc.grep').buffer, desc = 'grep buffer' },
    { '<Leader>fd', require('vc.grep').dotfiles, desc = 'grep dotfiles' },
    { '<Leader>ff', require('vc.grep').dir, desc = 'grep directory' },
    { '<Leader>fh', require('vc.grep').help, desc = 'grep help tags' },
    { '<Leader>fs', require('vc.grep').lsp_symbols, desc = 'grep lsp symbols' },

    -- Files
    { '<Leader>pd', require('vc.find').dotfiles, desc = 'find in dotfiles' },
    { '<Leader>ph', require('vc.find').history, desc = 'find in history' },
    { '<Leader>pp', require('vc.find').workspace, desc = 'find in workspace' },
    { '<Leader>pP', require('vc.find').files, desc = 'find in directory' },
  },
}
