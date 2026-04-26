vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })

-- Configure LSP signs.
vim.diagnostic.config(
  ---@type vim.diagnostic.Opts
  {
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = '•',
        [vim.diagnostic.severity.WARN] = '•',
        [vim.diagnostic.severity.HINT] = '•',
        [vim.diagnostic.severity.INFO] = '•',
      },
      numhl = {
        [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
      },
    },
  }
)

local nmap = require('vc.keymap').nmap
nmap('gH', vim.lsp.buf.hover, 'show documentation')
nmap('gR', vim.lsp.buf.rename, 'rename')
nmap('ga', vim.lsp.buf.code_action, 'code actions')
nmap('gd', vim.lsp.buf.definition, 'go to definition')
nmap('gh', vim.diagnostic.open_float, 'show line diagnostics')
nmap('gr', vim.lsp.buf.references, 'open references')
