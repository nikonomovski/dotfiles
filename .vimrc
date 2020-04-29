set autoindent         " always set autoindenting on
"set background=dark
"set t_Co=256           " this is needed for tmux
set cursorline         " Highlight current line
set encoding=utf-8
set expandtab          " spaces instead of tab
set hidden             " hide buffers, don't close
set hlsearch           " highlight search terms
set incsearch          " show search matches as you type
set laststatus=2       " show airline always
set nobackup
set nocompatible       " be iMproved, required
set noswapfile
set nowritebackup
set number             " enable line numbers
set shiftwidth=4       " number of spaces to use for autoindenting
set ignorecase
set smarttab           " insert tabs on the start of a line according to
                       "    shiftwidth, not tabstop
set tabstop=4          " set tab to 2 spaces
set mouse=a
set smartcase          " if you search pattern with all lowercase it
                       " will search case Insensitively
                       " with uppercase its sensitive

"set ttymouse=xterm2

set path=.,src,node_nodules
"set suffixesadd=.js,.jsx

if has("termguicolors")
    set termguicolors
endif

colorscheme quantum

syntax enable " enable syntax higlighting

"auto install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'KeitaNakamura/neodark.vim'
Plug 'joshdick/onedark.vim'
Plug 'kaicataldo/material.vim'
Plug 'mhartington/oceanic-next'
Plug 'rakr/vim-one'
Plug 'vim-scripts/upAndDown' " use Shift+up/down to move line
Plug 'airblade/vim-gitgutter'
Plug 'severin-lemaignan/vim-minimap'
Plug 'ryanoasis/vim-devicons'
Plug 'bronson/vim-trailing-whitespace' " paint trailing whitespace red, fix it with FixWhitespace
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'qpkorr/vim-bufkill' " use :BD to close buffer without closing the window
"Plugin 'Valloric/YouCompleteMe'
Plug 'ternjs/tern_for_vim'
Plug 'w0rp/ale'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'zivyangll/git-blame.vim'
" Plugin 'sheerun/vim-polyglot'
Plug 'trevordmiller/nova-vim'
Plug 'hzchirs/vim-material'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " pacman -S the_silver_searcher
Plug 'junegunn/fzf.vim'
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'flazz/vim-colorschemes' "cp colors/* ~/.vim/colors
Plug 'tpope/vim-commentary'
Plug 'yuttie/comfortable-motion.vim'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'tpope/vim-vinegar'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " CocInstall coc-json coc-tsserver coc-html coc-css coc-yaml coc-phpls coc-highlight coc-snippets coc-xml coc-markdownlint
Plug 'tobyS/pdv' " php auto doc
Plug 'tobyS/vmustache' "required by pdv

call plug#end()            " required

"""""""""""
" Airline
"""""""""""
let g:airline_powerline_fonts = 1                  " use powerline fonts
let g:airline_theme='quantum'                      " set quantum theme
let g:airline_skip_empty_sections = 1              " hide empty sections (err,warning)
let g:airline#extensions#tabline#enabled = 1       " enable advanced tabline
let g:airline#extensions#tabline#show_buffers = 1  " show all buffers when there's only one tab
let g:airline#extensions#tabline#show_splits = 0   " don't display open splits per tab
let g:airline#extensions#tabline#show_tabs = 1     " display tabs
"let g:airline#extensions#ycm#enabled = 1           " YouCompleteMe status for airline
let g:airline#extensions#ale#enabled = 1           " ALE linter status for airline

"""""""""""
" ALE async linter
"""""""""""
" let g:airline_section_error = '%{ale#statusline#Status()}'  " show ALE status in Airline error section
let g:ale_open_list = 1                                " show warnings/errors in loclist window
" list of enabled linters
let g:ale_linters = {
  \ 'javascript': ['eslint', 'jscs']
  \ }
let g:ale_linters = {
  \ 'php': ['php-cs-fixer']
  \ }

" Fix JavaScript code with ESlint
let g:ale_fixers = {}
let g:ale_fixers.javascript = ['eslint']

"""""""""""
" vim-devicons
"""""""""""
" https://github.com/ryanoasis/nerd-fonts#font-installation
"
"
"let g:WebDevIconsNerdTreeAfterGlyphPadding = ''  " the amount of space to use after the glyph character
let g:WebDevIconsUnicodeDecorateFolderNodes = 1  " enable folder icons in NERDtree
let g:DevIconsEnableFoldersOpenClose = 1         " enable open/closed folder icons in NERDTree
"let g:DevIconsDefaultFolderOpenSymbol = ' '     " symbol for open folders in NERDTree
"let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ' '

"let g:webdevicons_enable_airline_tabline = 1

"let NERDTreeDirArrowExpandable = ' '     " make arrows invisible
"let NERDTreeDirArrowCollapsible = ' '    " make arrows invisible

let g:jsx_ext_required = 0  " Allow JSX in normal JS files

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
nnoremap <silent> <leader><space> :Files<CR>

" Default fzf layout
nnoremap <silent> <Leader>b :Buffers<CR>
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g "" -U'

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" sudo apt-get install vim-gtk or sudo pacman -S gvim
set clipboard=unnamedplus

" comfortable motion
nnoremap <silent> <C-d> :call comfortable_motion#flick(1600)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-1600)<CR>

nnoremap <silent> <C-f> :call comfortable_motion#flick(3200)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(-3200)<CR>

let g:comfortable_motion_friction = 16000.0
let g:comfortable_motion_air_drag = 12.0


" auto use statement insert for PHP
" new Response<-- cursor here or on the name; hit \u now to insert the use statement

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

" COC
"
" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap  <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap  <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"pdv auto generate php doc
let g:pdv_template_dir = $HOME ."/.vim/plugged/pdv/templates_snip"
nmap <silent> <C-p> :call pdv#DocumentWithSnip()<CR>
