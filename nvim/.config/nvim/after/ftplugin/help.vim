setlocal number
setlocal relativenumber

let b:undo_ftplugin .= '|setlocal number<'
let b:undo_ftplugin .= '|setlocal relativenumber<'

" Use <CR> to jump to the help menu entry for the tag under the cursor.
nnoremap <buffer> <CR> <C-]>

" Use <Esc> to close the help menu.
nnoremap <buffer> <Esc> <Cmd>q<CR>

