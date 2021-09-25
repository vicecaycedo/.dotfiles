vim.g.nvim_tree_side = 'right'
vim.g.nvim_tree_show_icons = {
  files = 0,
  folders = 1,
  folder_arrows = 0,
  git = 0,
}
vim.g.nvim_tree_lsp_diagnostics = 1
vim.g.nvim_tree_bindings = {
  { key = '<Esc>', cb = '<Cmd>NvimTreeToggle<CR>' },
}

