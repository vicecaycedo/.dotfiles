require('nvim-tree').setup({
  diagnostics = { enable = true },
  hijack_cursor = true,
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
