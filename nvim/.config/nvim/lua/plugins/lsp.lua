return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    -- Autoinstall language servers.
    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = {
        'bashls',
        'cssls',
        'html',
        'lua_ls',
      },
    })
    require('mason-lspconfig').setup_handlers({
      -- Default setup for servers installed with Mason.
      function(server_name)
        require('lspconfig')[server_name].setup({
          capabilities = require('cmp_nvim_lsp').default_capabilities(),
        })
      end,
      -- Custom setups for servers installed with Mason.
      lua_ls = function()
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
      end,
    })

    -- Configure The Space Key LSP, if available.
    pcall(require, 'tsk.lsp')

    -- Configure Google LSP, if available.
    pcall(require, 'google.lsp')

    -- Don't show diagnostics as inline virtual text.
    vim.diagnostic.config({
      virtual_text = false,
    })

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
