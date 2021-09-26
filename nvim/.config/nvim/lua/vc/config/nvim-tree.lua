require('nvim-tree').setup {
  hijack_cursor = true,
  lsp_diagnostics = true,
  view = {
    mappings = {
      list = {
        { key = '<Esc>', cb = '<Cmd>NvimTreeToggle<CR>' },
      },
    },
  },
}

