local on_attach = function(client, bufnr)
   if client.resolved_capabilities.document_formatting then
        vim.cmd([[
          aug lsp_format
            au! * <buffer>
            au BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
          aug END
        ]])
    end
end

-- Dart.
require('lspconfig').dartls.setup {
  on_attach = on_attach,
  settings = {
    allowAnalytics = false,
    flutterCreateOrganization = 'com.thresholdeng',
    flutterHotReloadOnSave = "always",
  }
}

-- Lua.
local lua_ls_root_path = '/Users/vc/.bin/lua-language-server'
local lua_ls_binary_path = '/Users/vc/.bin/lua-language-server/bin/macOS/lua-language-server'
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
require'lspconfig'.sumneko_lua.setup {
  cmd = {lua_ls_binary_path, "-E", lua_ls_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        path = runtime_path,
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {
          -- Neovim
          'vim',
          -- Packer
          'use',
        },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
}

