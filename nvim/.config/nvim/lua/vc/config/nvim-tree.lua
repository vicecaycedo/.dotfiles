require('nvim-tree').setup({
  hijack_cursor = true,
  diagnostics = { enable = true },
  view = {
    mappings = {
      list = {
        {
          key = '<Esc>',
          cb = '<Cmd>NvimTreeToggle<CR>',
        },
      },
    },
    number = true,
    relativenumber = true,
  },
})
