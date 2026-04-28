vim.pack.add({ 'https://github.com/folke/snacks.nvim' })

require('snacks').setup({
  ---@type snacks.Config
  input = {
    win = {
      relative = 'cursor',
      title_pos = 'left',
    },
  },
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
  image = {
    doc = {
      enabled = false,
    },
  },
  styles = {
    -- Position image previews relative to the editor so they do not draw over
    -- bufferline/tabline. Snacks defaults this style to relative = 'cursor'.
    snacks_image = {
      relative = 'editor',
    },
  },
})

local nmap = require('vc.keymap').nmap
nmap('<Leader>pR', Snacks.picker.resume, 'resume picker')
nmap('<Leader>D', Snacks.picker.diagnostics, 'view all diagnostics')
nmap('<Leader>d', Snacks.picker.diagnostics_buffer, 'view buffer diagnostics')
