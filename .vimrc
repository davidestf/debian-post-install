" Requires molokai color scheme
" wget -O ~/.vim/colors/molokai.vim https://github.com/tomasr/molokai/blob/master/colors/molokai.vim

" Vundle settings
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dense-analysis/ale'
Plugin 'pearofducks/ansible-vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'airblade/vim-gitgutter'
Plugin 'morhetz/gruvbox'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" end Vundle settings

" Airline settings
let g:airline_theme='distinguished'
let g:airline_powerline_fonts = 1

" generic settings
set showmatch
set visualbell
set t_vb=
set hlsearch
set smartcase
set ignorecase
set incsearch
set autoindent
set shiftwidth=4
set smartindent
set softtabstop=8
set undolevels=1000
set backspace=indent,eol,start
set completeopt=menuone,longest
set shortmess+=c
set updatetime=750
set listchars=tab:>-,trail:~,nbsp:_
set list
set number
set background=dark
syntax on

" colors
" colo molokai
colo gruvbox

" keybinds
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <S-Up> :tabnext<CR>
nnoremap <S-Down> :tabprevious<CR>
nnoremap <F12> :ALEFix<CR>
nnoremap <F10> :ALEToggle<CR>
nnoremap <C-l> :noh<CR>
" AutoComplPop menu keys
inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"
inoremap <expr> <CR> pumvisible() ? "<C-y>" : "<CR>"
inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"

" ALE generic settings
let g:airline#extensions#ale#enabled = 1
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 0

" ALE define linters
let g:ale_linters_explicit = 1
let g:ale_linters = {
\    'sh': ['shellcheck'],
\    'ansible': ['ansible_lint'],
\    'yaml.ansible': ['ansible_lint'],
\    'json': ['jsonlint']
\}

" ALE fixer settings
let g:ale_fixers = {
\    'sh': ['shfmt']
\}
let g:ale_fix_on_save = 1

" workaround to recognize yml files as ansible files
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.yml set filetype=yaml.ansible
    au BufNewFile,BufRead *.yaml set filetype=yaml.ansible
augroup END

" Auto close ALE loclist on exit
autocmd QuitPre * if empty(&bt) | lclose | endi

" Auto close NERDTree on exit if no files open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
