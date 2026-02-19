local M = {}

M.buffer = function()
  Snacks.picker.lines({
    title = 'grep Buffer',
  })
end

M.dir = function()
  Snacks.picker.grep({
    title = 'grep Directory',
    hidden = true,
    follow = true,
  })
end

M.dotfiles = function()
  Snacks.picker.grep({
    title = 'grep Dotfiles',
    cwd = vim.fn.stdpath('config'),
    hidden = true,
    follow = true,
  })
end

M.help = function()
  Snacks.picker.help({
    title = 'grep Help',
  })
end

M.lsp_symbols = function()
  Snacks.picker.lsp_symbols({
    title = 'grep LSP Symbols',
  })
end

return M
