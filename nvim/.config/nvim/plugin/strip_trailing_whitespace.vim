aug strip_trailing_whitespace
  au!
  au BufWritePre * :%s/\s\+$//e
aug END

