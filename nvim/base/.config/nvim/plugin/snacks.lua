local nmap = require('vc.keymap').nmap

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
  image = {},
})

nmap('<Leader>pR', Snacks.picker.resume, 'resume picker')

nmap('<Leader>D', Snacks.picker.diagnostics, 'view all diagnostics')
nmap('<Leader>d', Snacks.picker.diagnostics_buffer, 'view buffer diagnostics')

nmap('<Leader>fb', require('vc.grep').buffer, 'grep buffer')
nmap('<Leader>fd', require('vc.grep').dotfiles, 'grep dotfiles')
nmap('<Leader>ff', require('vc.grep').dir, 'grep directory')
nmap('<Leader>fh', require('vc.grep').help, 'grep help tags')
nmap('<Leader>fs', require('vc.grep').lsp_symbols, 'grep lsp symbols')

nmap('<Leader>pd', require('vc.find').dotfiles, 'find in dotfiles')
nmap('<Leader>ph', require('vc.find').history, 'find in history')
nmap('<Leader>pp', require('vc.find').workspace, 'find in workspace')
nmap('<Leader>pr', require('vc.find').related, 'find in related')
nmap('<Leader>pP', require('vc.find').files, 'find in directory')
