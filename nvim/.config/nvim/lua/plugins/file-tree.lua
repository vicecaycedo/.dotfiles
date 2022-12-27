return {
  'kyazdani42/nvim-tree.lua',
  dependencies = { 'kyazdani42/nvim-web-devicons' },
  keys = {
    { '<Leader>te', '<Cmd>NvimTreeToggle<CR>', desc = 'toggle file explorer' },
    {
      '<Leader>tf',
      '<Cmd>NvimTreeFindFile<CR>',
      desc = 'find file in file explorer',
    },
  },
  config = {
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
