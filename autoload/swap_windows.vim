scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim

let s:markedWinNum = 0

function! swap_windows#mark_window()
  let s:markedWinNum = winnr()
endfunction

function! swap_windows#do_swap()
  if s:markedWinNum > 0
    " Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe s:markedWinNum . "wincmd w"
    " Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    " Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    " Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    " Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf
  endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
