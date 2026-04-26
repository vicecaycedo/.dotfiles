vim.pack.add({ 'https://github.com/mofiqul/vscode.nvim' })

require('vscode').setup({
  transparent = true,
  group_overrides = {
    StatusLine = { bg = 'none' },
    TabLineFill = { bg = 'none' },
  },
})

vim.cmd.colorscheme('vscode')
