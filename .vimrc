execute pathogen#infect()

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'rust-lang/rust.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-syntastic/syntastic'
Plugin 'posva/vim-vue'
Plugin 'elixir-editors/vim-elixir'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'OmniSharp/omnisharp-vim'
Plugin 'joonty/vdebug'
Plugin 'tpope/vim-dispatch'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Disable YouCompleteMe at startup
let g:loaded_youcompleteme = 1

set foldmethod=indent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set formatoptions+=r "Keeps comments inline
set nowrap "No more wordwrap; it's ugly
set fileformat=unix
set fileformats=unix,dos
let mapleader = "\\"
"set listchars=nbsp:¬
nnoremap <space> za
vnoremap <space> zf

" Allow changing windows with arrow keys while in a Chrome tab (C-w caused problems)
"nmap <silent> <Up> :wincmd k<CR>
"nmap <silent> <Down> :wincmd j<CR>
"nmap <silent> <Left> :wincmd h<CR>
"nmap <silent> <Right> :wincmd l<CR>

autocmd BufNewFile,BufRead *.rb set tabstop=2 shiftwidth=2 "ruby files should only indent by two spaces

autocmd BufNewFile,BufRead *.py set tabstop=2 shiftwidth=2 softtabstop=2 expandtab shiftround "python files should only indent by two spaces


"autocmd vimenter * NERDTree
"autocmd vimenter * wincmd l "move to right screen

filetype plugin indent on
filetype plugin on
syntax on
syntax enable
set omnifunc=syntaxcomplete#Complete

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { "mode": "passive" }
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec='/usr/bin/ls'
let g:syntastic_javascript_eslint_exe='eslint_d'
nnoremap <leader>c :SyntasticCheck<CR>
nnoremap <leader>r :SyntasticReset<CR>

" Autofix entire buffer with eslint_d:
nnoremap <leader>f mF:%!eslint_d --stdin --fix-to-stdout<CR>`F

" Autofix visual selection with eslint_d:
vnoremap <leader>f :!eslint_d --stdin --fix-to-stdout<CR>gv


highlight ColorColumn ctermbg=white
highlight ExtraWhitespace ctermbg=darkred
colorscheme desert
set colorcolumn=80
set foldlevelstart=0

autocmd BufEnter * let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"
set title
set nu
set autoindent
autocmd BufNewFile,BufRead *.ejs source $HOME/.vim/jst.vim
autocmd BufNewFile,BufRead *.sg set syntax=surveygizmo
autocmd BufNewFile,BufRead *.gs set syntax=javascript
autocmd BufNewFile,BufRead *.go set noexpandtab
autocmd BufNewFile,BufRead *.apib set syntax=markdown tabstop=4
autocmd BufNewFile,BufRead *.mako set syntax=mako
autocmd BufNewFile,BufRead *.sls set syntax=yaml
autocmd BufNewFile,BufRead *.js set tabstop=2 expandtab shiftwidth=2
autocmd BufNewFile,BufRead *.ctp set autoindent tabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.cs set autoindent tabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.php set tabstop=2 expandtab shiftwidth=2
autocmd BufNewFile,BufRead *.hs set tabstop=8 expandtab softtabstop=4 shiftwidth=4 shiftround
autocmd BufNewFile,BufRead *.yaml set tabstop=4 expandtab softtabstop=4 shiftwidth=4 shiftround foldmethod=indent
match ExtraWhitespace /\s\+$\| \+\ze\t/

let g:rustfmt_autosave = 1
set incsearch

set laststatus=2
set statusline=%F%=%l:%c

map ꧅ i
imap ꧅ <esc>
