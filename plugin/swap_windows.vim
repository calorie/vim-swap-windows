if exists('g:loaded_swap_windows')
  finish
endif
let g:loaded_swap_windows = 1

let s:save_cpo = &cpo
set cpo&vim

command! MarkWindow
\    call swap_windows#mark_window()
command! SwapWindows
\    call swap_windows#do_swap()

let &cpo = s:save_cpo
unlet s:save_cpo
