aug highlight_yank
  au!
  au TextYankPost * silent! lua vim.highlight.on_yank()
aug END

