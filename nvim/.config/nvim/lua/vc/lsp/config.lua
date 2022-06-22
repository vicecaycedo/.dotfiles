local lspconfig = require('lspconfig')

-- Set up nvim-lsp-installer.
require('nvim-lsp-installer').setup({
  ensure_installed = {
    'sumneko_lua',
  },
})

-- Set up Lua language server.
lspconfig.sumneko_lua.setup({
  capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
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
  capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
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

-- Configure how diagnostics are displayed.
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = false,
  }
)
