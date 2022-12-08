require('nvim-tree').setup({
  hijack_cursor = true,
  renderer = {
    icons = {
      show = {
        file = false,
        folder = true,
        folder_arrow = false,
        git = false,
      },
    },
  },
  view = {
    mappings = {
      list = {
        {
          key = '<Esc>',
          cb = '<Cmd>NvimTreeToggle<CR>',
        },
        {
          key = 'O',
          action = 'expand_all',
        },
      },
    },
    number = true,
    relativenumber = true,
    signcolumn = 'no',
  },
})
