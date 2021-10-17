" To disable StripTrailingWhitespace for a buffer,
"   let b:noStripTrailingWhitespace=1.
function StripTrailingWhitespace()
  if exists('b:noStripTrailingWhitespace') && b:noStripTrailingWhitespace
    return
  endif
  %s/\s\+$//e
endfun

aug strip_trailing_whitespace
  au!
  au BufWritePre * call StripTrailingWhitespace()
aug END

