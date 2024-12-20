require('lspconfig').sourcekit.setup({
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  cmd = { vim.trim(vim.fn.system('xcrun -f sourcekit-lsp')) },
  filetypes = { 'swift' },
})
