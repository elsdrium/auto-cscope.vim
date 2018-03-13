" Copyright © 2018 HsuehMin Chen

" MIT License

" Permission is hereby granted, free of charge, to any person obtaining
" a copy of this software and associated documentation files (the "Software"),
" to deal in the Software without restriction, including without limitation
" the rights to use, copy, modify, merge, publish, distribute, sublicense,
" and/or sell copies of the Software, and to permit persons to whom the
" Software is furnished to do so, subject to the following conditions:

" The above copyright notice and this permission notice shall be included
" in all copies or substantial portions of the Software.

" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
" EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
" OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
" IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
" DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
" TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
" OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


if has('cscope')
if exists("g:auto_cscope_loaded")
    finish
endif
let g:auto_cscope_loaded = 1

" global variables
let g:auto_cscope_input = "cscope.files"
let g:auto_cscope_output = "cscope.out"
let g:auto_cscope_executive = "cscope"

" script variables
let s:auto_cscope_csdb = findfile(g:auto_cscope_output, ".;")
let s:auto_cscope_dbdir = fnamemodify(s:auto_cscope_csdb, ":h")
silent exe "cs add " . s:auto_cscope_csdb . " " . s:auto_cscope_dbdir
set csverb
" Use quickfix window to show cscope results
set cscopequickfix=s-,g-,c-,d-,i-,t-,e-

function! auto_cscope#Init()
endfunction

function! auto_cscope#RefreshCsdb()
    if !empty(get(g:, 'auto_cscope_dbdir'))
        silent exe "!(cd " . s:auto_cscope_dbdir . " && exec " \
            . g:auto_cscope_executive . " -b -i " . g:auto_cscope_input . ")"
        silent exe "cs reset"
        exe "redraw!"
    endif
endfunction

function! auto_cscope#CscopeQueryQF(qtype)
    if &ft == 'qf'
        cclose
        return
    endif
    call setqflist([])
    let wview = winsaveview()
    let fname = @%
    exe "normal! mY"
    silent! keepjumps exe "cs find " . a:qtype . " " . expand("<cword>")
    if fname != @%
        exe "normal! `Y"
        bd #
    endif
    call winrestview(wview)
    botright cw
endfunction

endif " has('cscope')
