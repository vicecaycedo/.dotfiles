local lspconfig = require('lspconfig')

-- Set up nvim-lsp-installer.
require('nvim-lsp-installer').setup({
  ensure_installed = {
    'sumneko_lua',
  },
})

local lsp_capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

-- Set up Lua language server.
lspconfig.sumneko_lua.setup({
  capabilities = lsp_capabilities,
  on_attach = require('vc.lsp.util').on_attach,
  settings = {
    Lua = {
      runtime = {
        path = vim.split(package.path, ';'),
        version = 'LuaJIT',
      },
      diagnostics = {
        disable = {
          'different-requires',
        },
        globals = {
          'vim', -- Neovim
          'use', -- Packer
        },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files.
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
})

-- Set up null-ls (general purpose language server).
local null_ls = require('null-ls')
null_ls.setup({
  capabilities = lsp_capabilities,
  on_attach = require('vc.lsp.util').on_attach,
  sources = {
    -- Lua formatter.
    null_ls.builtins.formatting.stylua.with({
      extra_args = {
        '--config-path',
        vim.fn.expand('~/.config/stylua/stylua.toml'),
      },
    }),
  },
})

-- Don't show diagnostics as inline virtual text.
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = false,
  }
)

-- Configure LSP signs.
local diagnostic_types = { 'Error', 'Warn', 'Hint', 'Info' }
for _, type in pairs(diagnostic_types) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = '•', texthl = hl, numhl = '' })
end
