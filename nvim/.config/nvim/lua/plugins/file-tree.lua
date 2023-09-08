return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '<Leader>te', '<Cmd>NvimTreeToggle<CR>', desc = 'Toggle file explorer' },
    {
      '<Leader>tf',
      '<Cmd>NvimTreeFindFile<CR>',
      desc = 'Find file in file explorer',
    },
  },
  opts = {
    git = {
      enable = false,
    },
    hijack_cursor = true,
    renderer = {
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = false,
          git = false,
        },
      },
    },
    view = {
      number = true,
      relativenumber = true,
      signcolumn = 'no',
      width = 50,
    },
    on_attach = function(bufnr)
      local api = require('nvim-tree.api')
      -- Use all default mappings.
      api.config.mappings.default_on_attach(bufnr)
      -- Add/override mappings.
      vim.keymap.set('n', '<Esc>', api.tree.close, { buffer = bufnr })
      vim.keymap.set('n', 'O', api.tree.expand_all, { buffer = bufnr })
    end,
  },
}
