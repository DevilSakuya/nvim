set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

if !has('nvim')
  set ttymouse=xterm2
endif

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

if exists(':tnoremap')
  tnoremap <Esc> <C-\><C-n>
endif
