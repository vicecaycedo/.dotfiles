-- Supported language servers:
--   Through nvim-lspinstall (`:LspInstall <server>`):
--     lua

-- Configure how diagnostics are displayed.
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })

local on_attach = function(client)
  -- Autoformat on save, if available.
  if client.resolved_capabilities.document_formatting then
    vim.cmd(
      [[
      aug lsp_format
        au! * <buffer>
        au BufWritePre <buffer> lua require('vc.lsp-util').format_buffer()
      aug END
    ]])
  end

  -- Organize imports, if available.
  local code_actions = client.resolved_capabilities.code_action.codeActionKinds
  if _G.has(code_actions, 'source.organizeImports') then
    vim.cmd(
      [[
      aug lsp_organize_imports
        au! * <buffer>
        au BufWritePre <buffer> lua require('vc.lsp-util').organize_imports()
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
}

local function server_config(server)
  local config = { on_attach = on_attach }

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

