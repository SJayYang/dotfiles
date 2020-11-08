" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Plug 'ctrlpvim/ctrlp.vim'
" Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
" explore this one more later on
Plug 'editorconfig/editorconfig-vim'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()
:

" ale related config
let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'javascript': ['eslint'],
      \}


" nerdtree related config
map <C-o> :NERDTreeToggle<CR>

" lightline related config
set laststatus=2
set noshowmode


" fzf related configs
" Map the CtrlP keybinding to using fzf
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
nnoremap <C-p> :RG<Cr>
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)



" End fzf related config

" General modifications
set nocompatible
syntax on
filetype plugin indent on
set wrap
set encoding=utf-8
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set textwidth=80


