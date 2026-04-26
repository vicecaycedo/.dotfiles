local grep_buffer = function()
  Snacks.picker.lines({
    title = 'grep Buffer',
  })
end

local grep_dir = function()
  Snacks.picker.grep({
    title = 'grep Directory',
    hidden = true,
    follow = true,
  })
end

local grep_dotfiles = function()
  Snacks.picker.grep({
    title = 'grep Dotfiles',
    cwd = vim.fn.stdpath('config'),
    hidden = true,
    follow = true,
  })
end

local grep_help = function()
  Snacks.picker.help({
    title = 'grep Help',
  })
end

local grep_lsp_symbols = function()
  Snacks.picker.lsp_symbols({
    title = 'grep LSP Symbols',
  })
end

local nmap = require('vc.keymap').nmap
nmap('<Leader>fb', grep_buffer, 'grep buffer')
nmap('<Leader>fd', grep_dotfiles, 'grep dotfiles')
nmap('<Leader>ff', grep_dir, 'grep directory')
nmap('<Leader>fh', grep_help, 'grep help tags')
nmap('<Leader>fs', grep_lsp_symbols, 'grep lsp symbols')
