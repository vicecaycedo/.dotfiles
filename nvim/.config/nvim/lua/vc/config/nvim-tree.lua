require('nvim-tree').setup({
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
    width = 50,
  },
})
