local M = {}

M.lua = {
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
}

return M
