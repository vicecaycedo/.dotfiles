return {
  'neovim/nvim-lspconfig',
  config = function()
    require('lspconfig').lua_ls.setup({
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          diagnostics = {
            globals = {
              'nmap', -- Custom vim.keymap.set wrapper
            },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files.
            library = vim.api.nvim_get_runtime_file('', true),
            checkThirdParty = false,
          },
        },
      },
    })

    -- Configure The Space Key LSP, if available.
    pcall(require, 'tsk.lsp')

    -- Configure Google LSP, if available.
    pcall(require, 'google.lsp')

    -- Configure LSP signs.
    local diagnostic_types = { 'Error', 'Warn', 'Hint', 'Info' }
    for _, type in pairs(diagnostic_types) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = '•', texthl = hl, numhl = '' })
    end

    -- Set keymaps.
    nmap('gH', vim.lsp.buf.hover, 'show documentation')
    nmap('gR', vim.lsp.buf.rename, 'rename')
    nmap('ga', vim.lsp.buf.code_action, 'code actions')
    nmap('gd', vim.lsp.buf.definition, 'go to definition')
    nmap('gh', vim.diagnostic.open_float, 'show line diagnostics')
    nmap('gr', vim.lsp.buf.references, 'open references')
  end,
}
