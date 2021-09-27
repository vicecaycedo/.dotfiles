-- Supported language servers:
--   Manually installed:
--     dart (bundled with Flutter)
--   Through nvim-lspinstall (`:LspInstall <server>`):
--     angular, bash, css, html, json, lua, python, vim, yaml

-- Configure how diagnostics are displayed.
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = false,
    -- underline = false,
  }
)

local on_attach = function(client)
   -- Autoformat on save, if available.
   if client.resolved_capabilities.document_formatting then
     vim.cmd([[
       aug lsp_format
         au! * <buffer>
         au BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
       aug END
     ]])
   end
end

local lsp_settings = {
  lua = {
    Lua = {
      runtime = {
        path = vim.split(package.path, ';'),
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {
          'vim',  -- Neovim
          'use',  -- Packer
        },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files.
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        }
      },
    },
  },
}

local function server_config(server)
  local config = {
    on_attach = on_attach,
  }

  if server == 'lua' then
    config.settings = lsp_settings.lua
  end

  return config
end

-- Loads installed servers.
local function setup_servers()
  local lsp_install = require('lspinstall')
  lsp_install.setup()

  local servers = lsp_install.installed_servers()
  for _, server in pairs(servers) do
    local config = server_config(server)
    require('lspconfig')[server].setup(config)
  end
end

-- Load installed servers.
setup_servers()

-- Automatically reload installed servers after `:LspInstall <server>`.
require('lspinstall').post_install_hook = function()
  -- Reload installed servers.
  setup_servers()
  -- Trigger FileType autocommands that start the servers.
  vim.cmd([[bufdo e]])
end

-- Manage Flutter LSP separately.
require('flutter-tools').setup {
  dev_tools = {
    auto_open_browser = true,
  },
  lsp = {
    on_attach = on_attach,
    settings = {
      allowAnalytics = false,
      flutterCreateOrganization = 'com.thresholdeng',
      flutterHotReloadOnSave = 'always',
      showTodos = false,
    }
  }
}

