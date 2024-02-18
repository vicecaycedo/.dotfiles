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
  },
}
