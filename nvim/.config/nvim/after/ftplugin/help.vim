setlocal number
setlocal relativenumber

let b:undo_ftplugin .= '|setlocal number<'
let b:undo_ftplugin .= '|setlocal relativenumber<'

nnoremap <buffer> <CR> <C-]>

