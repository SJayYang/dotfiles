" Plugins will be downloaded under the specified directory.
set rtp+=/usr/local/opt/fzf
call plug#begin('~/.vim/plugged')
let g:ale_disable_lsp = 1

" Plug 'ctrlpvim/ctrlp.vim'
" Plug '/usr/local/opt/fzf'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
" explore this one more later on
Plug 'editorconfig/editorconfig-vim'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'ervandew/supertab'
Plug 'francoiscabrol/ranger.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'reedes/vim-pencil'
Plug 'tpope/vim-surround'
Plug 'takac/vim-hardtime'
Plug 'python-rope/ropevim'
" Jedi vi
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set mouse=a
" Goyo + limelight config
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Vim pencil related config
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init({'wrap':'soft'})
augroup END

autocmd FileType text setlocal spell

" Material Theme related config (https://github.com/kaicataldo/material.vim)

if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif
let g:material_terminal_italics = 1
let g:material_theme_style = 'palenight'
colorscheme material

" JSX related plugins


" JSX related config
let g:jsx_ext_required = 0


" ale related config
" 'python': ['flake8', 'pylint'],
let g:ale_linters = {
      \   'python': ['flake8'],
      \   'javascript': ['eslint'],
      \   'css': ['csslint'],
      \   'sh': ['shellcheck', 'bashate'],
      \}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_delay = 1000
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_warn_about_trailing_whitespace = 1
let g:ale_warn_about_trailing_blank_lines = 1
let g:ale_sh_bashate_options = '--ignore E006'
let g:ale_set_signs = 1
" let g:ale_set_highlights = 0
highlight ALEError ctermbg=none cterm=underline
highlight ALEWarning ctermbg=none cterm=underline

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

" lightline config
let g:lightline = { 'colorscheme': 'material_vim' }


" deal with colors
"if !has('gui_running')
"  set t_Co=256
"endif
" let base16colorspace=256
" set background=dark
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

" Code folding
set foldenable
set foldmethod=syntax
set foldlevel=99
