require('nvim-tree').setup({
  diagnostics = { enable = true },
  hijack_cursor = true,
  icons = {
    show = {
      file = false,
      folder = true,
      folder_arrow = false,
      git = false,
    },
  },
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
