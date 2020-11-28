" Plugins will be downloaded under the specified directory.
set rtp+=/usr/local/opt/fzf
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
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" JSX related plugins

Plug 'sheerun/vim-polyglot'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" JSX related config
let g:jsx_ext_required = 0


" ale related config
let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'javascript': ['eslint'],
      \   'css': ['csslint'],
      \   'sh' : ['shellcheck', 'bashate'],
      \}
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_warn_about_trailing_blank_lines = 0

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

nnoremap <C-r> :RG<Cr>
nnoremap <C-p> :Files<Cr>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)



" End fzf related config

" deal with colors
if !has('gui_running')
  set t_Co=256
endif
let base16colorspace=256
set background=dark
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
set formatoptions-=tc " wrap text and comments using textwidth
set number
set relativenumber
set ignorecase
set smartcase
set showmatch " show matching braces when text indicator is over them
set incsearch " incremental search (as string is being typed)

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
