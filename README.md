auto-cscope.vim
===============

A simple, useful plugin to manage/query cscope database in Vim.


Feature
-------

 - Search source list (default:`cscope.files`) upward recursively.
 - Generate/refresh cscope database (default:`cscope.output`) easily.
 - Query cscope database without autojumping to first result, quite convenient!


Configuration Example
--------------

```vim
if has("cscope")
  " Use both cscope and ctag
  set cscopetag
  " Use tags for definition search first
  set cscopetagorder=1

  " Refresh cscope database
  nnoremap ;r :call auto_cscope#RefreshCsdb()<CR>
  " :cs find s <current word>
  nnoremap ;s :call auto_cscope#CscopeQueryQF("s")<CR>
  " :cs find g <current word>
  nnoremap ;g :call auto_cscope#CscopeQueryQF("g")<CR>
  " :cs find c <current word>
  nnoremap ;c :call auto_cscope#CscopeQueryQF("c")<CR>
  " :cs find d <current word>
  nnoremap ;d :call auto_cscope#CscopeQueryQF("d")<CR>
endif
```


Installation
------------

Use plugin manager is recommended.

[vim-plug](https://github.com/junegunn/vim-plug):
```vim
Plug 'elsdrium/auto-cscope.vim'
```

Contribution
------------

Any suggestion/feedback/PR is appreciated.


License
-------
MIT
