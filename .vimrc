set t_Co=256
set rtp+='/root/.local/lib/python2.6/site-packages/powerline/bindings/vim/plugin/powerline.vim'
set laststatus=2 
set t_Co=256

" snippet for  Powerline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set t_Co=256

" VIM Plugins
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Git flag for files in Nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'wfxr/forgit'

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" YII manual
Plug 'mikehaertl/yii2-apidoc-vim'

" Relative Number
Plug 'ericbn/vim-relativize'

" post install (yarn install | npm install) then load plugin only for editing
" supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'

" css colors
Plug 'gko/vim-coloresque'

" Ninja support
Plug 'lepture/vim-jinja'

" Color Scheme
Plug 'drewtempelmeyer/palenight.vim'

" GIT Support
Plug 'airblade/vim-gitgutter'

" Ident PHP
Plug '2072/PHP-Indenting-for-VIm'

" Ident PHP
Plug 'Yggdroot/indentLine'

" Pack Languages
Plug 'sheerun/vim-polyglot'

" Lint
Plug 'dense-analysis/ale'

" PHP Autocomplete
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

" Initialize plugin system
Plug 'ternjs/tern_for_vim'

" Search pattern text
Plug 'mileszs/ack.vim'

" HTML Snippets
Plug 'mattn/emmet-vim'

" Editor config
Plug 'editorconfig/editorconfig-vim'

" Easy way ti browse the tags of the current file
Plug 'majutsushi/tagbar'

" Autocomplete PHP
Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'}

" Autocomplete
" Plug 'ycm-core/YouCompleteMe'

" Comment code
Plug 'tomtom/tcomment_vim'

" Multicursor
Plug 'terryma/vim-multiple-cursors'

" Targets
Plug 'wellle/targets.vim'

" Autcomplete
" if has('nvim')
"     Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"     Plug 'Shougo/deoplete.nvim'
"     Plug 'roxma/nvim-yarp'
"     Plug 'roxma/vim-hug-neovim-rpc'
" endif
call plug#end()

" Super autocomplete
" let g:deoplete#enable_at_startup = 1

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Color Scheme
set background=dark 
colorscheme palenight

" Set Delat GIT Status
set updatetime=100

" Relativenumber Plugin Config
set number relativenumber

" find tags in current directory or look up each child folder
set tags=./tags,tags;

" Ident character
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Ident enabled
let g:indentLine_enabled = 1

" Hook for run ctags every time that save a php file
au BufWritePost *.php silent! !eval '[ -f ".git/hooks/ctags" ] && .git/hooks/ctags' &

" Close Nerdtree after file selected
let NERDTreeQuitOnOpen=1

" Emmet configurtation
let g:user_emmet_leader_key=','

" The sivler research
let g:ackprg = 'ag --nogroup --nocolor --column'

" MAPS
" Nerdtree shortcut
map <F3> :NERDTreeToggle<CR>

" set encodging
set encoding=utf-8

" Change tabs maps
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

" Avoid Beeps sound error
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Ident lines
:vmap <Tab> >
:vmap <S-Tab> <

" FZF
nmap <F1> :Files<CR>
nmap <F2> :GFiles<CR>

" Tab navigaton
nmap <F10> :tabn<CR>
nmap <F9> :tabp<CR>

" Buffer navigation
nmap <F6> :bnext<CR>
nmap <F5> :bprev<CR>

" highlight row of cursor
set cursorline

set tabstop=4
set shiftwidth=4
set expandtab
set rtp+='/root/.local/lib/python2.6/site-packages/powerline/bindings/vim/plugin/powerline.vim'
set laststatus=2 
set t_Co=256
set rtp+='/root/.local/lib/python2.6/site-packages/powerline/bindings/vim/plugin/powerline.vim'
set laststatus=2 
set t_Co=256
set rtp+='/root/.local/lib/python2.6/site-packages/powerline/bindings/vim/plugin/powerline.vim'
set laststatus=2 
set t_Co=256
set rtp+='/root/.local/lib/python2.6/site-packages/powerline/bindings/vim/plugin/powerline.vim'
set laststatus=2 
set t_Co=256
set rtp+='/root/.local/lib/python2.6/site-packages/powerline/bindings/vim/plugin/powerline.vim'
set laststatus=2 
set t_Co=256
set rtp+='/root/.local/lib/python2.6/site-packages/powerline/bindings/vim/plugin/powerline.vim'
set laststatus=2 
set t_Co=256
set rtp+='/root/.local/lib/python2.6/site-packages/powerline/bindings/vim/plugin/powerline.vim'
set laststatus=2 
set t_Co=256
set rtp+='/root/.local/lib/python2.6/site-packages/powerline/bindings/vim/plugin/powerline.vim'
set laststatus=2 
set t_Co=256
set rtp+='/root/.local/lib/python2.6/site-packages/powerline/bindings/vim/plugin/powerline.vim'
set laststatus=2 
set t_Co=256
set rtp+='/root/.local/lib/python2.6/site-packages/powerline/bindings/vim/plugin/powerline.vim'
set laststatus=2 
set t_Co=256
set rtp+='/root/.local/lib/python2.6/site-packages/powerline/bindings/vim/plugin/powerline.vim'
set laststatus=2 
set t_Co=256
set rtp+='/root/.local/lib/python2.6/site-packages/powerline/bindings/vim/plugin/powerline.vim'
set laststatus=2 
set t_Co=256
set rtp+='/root/.local/lib/python2.6/site-packages/powerline/bindings/vim/plugin/powerline.vim'
set laststatus=2 
set t_Co=256
