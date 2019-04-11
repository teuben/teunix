hi Search cterm=bold,reverse ctermfg=3 ctermbg=0
set autoindent hlsearch noshowmatch ruler vb
set shiftwidth=2 undolevels=32 wrapmargin=2
map q :wq
map Q :q!
map , :nohlsearch<CR>

if ! &compatible
  set tabstop=8

  " Remove trailing spaces from lines in C/C++/shell files.
  " Also expands existing tab characters.
  function! RemoveWhitespaceEOL()
    if (&filetype == 'c' || &filetype == 'cpp' || &filetype == 'sh')
      normal m`
      silent! :%s/\s\+$//e
      normal ``
      retab
    endif
  endfunction

  if has("autocmd")
    au BufWritePre * call RemoveWhitespaceEOL()

    " Have Vim jump to the last position when reopening a file.
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal g'\"" | endif

    " Expand tabs in C/C++/Python/RST/sh files (only).
    au FileType c,cpp,python,rst,sh setlocal expandtab
  endif

  " Colors are defined in ~/.vim/colors/xterm.vim.
  color xterm
  syntax on
endif
