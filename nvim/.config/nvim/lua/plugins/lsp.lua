return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    event = 'VeryLazy',
    config = function()
      -- Autoinstall language servers.
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = { 'sumneko_lua' },
      })

      -- Set up Lua language server.
      local lspconfig = require('lspconfig')
      lspconfig.sumneko_lua.setup({
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        on_attach = require('vc.lsp-util').on_attach,
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

      -- Configure Google LSP, if available.
      if vim.fn.isdirectory(vim.fn.stdpath('config') .. '/lua/google') then
        require('google.lsp')
      end

      -- Don't show diagnostics as inline virtual text.
      vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics,
        { virtual_text = false }
      )

      -- Configure LSP signs.
      local diagnostic_types = { 'Error', 'Warn', 'Hint', 'Info' }
      for _, type in pairs(diagnostic_types) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = '•', texthl = hl, numhl = '' })
      end

      -- Set keymaps.
      nmap('gH', vim.lsp.buf.hover, 'Show documentation')
      nmap('gR', vim.lsp.buf.rename, 'Rename')
      nmap('ga', vim.lsp.buf.code_action, 'Code actions')
      nmap('gd', vim.lsp.buf.definition, 'Go to definition')
      nmap('gh', vim.diagnostic.open_float, 'Show line diagnostics')
      nmap('gr', vim.lsp.buf.references, 'Open references')
      nmap('<Leader>F', vim.lsp.buf.format, 'Format file')
    end,
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    ft = { 'lua' },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local null_ls = require('null-ls')
      null_ls.setup({
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        on_attach = require('vc.lsp-util').on_attach,
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
    end,
  },
}
