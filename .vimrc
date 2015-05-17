set sessionoptions-=options
" cursorline
set cursorline
" status
set laststatus=2
set nu
set ruler
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set showmatch
set matchtime=4
set incsearch
set ignorecase
set hlsearch
set smartcase
set wildmenu
set t_kD=^?
set backspace=indent,eol,start
" nnoremap j gj
" nnoremap k gk
syntax enable
colorscheme torte
set encoding=utf8
set fileencoding=utf-8
set title
set wrap
set noswapfile
set nowritebackup
set nobackup
set matchpairs& matchpairs+=<:>
set matchtime=3
set switchbuf=useopen
set showcmd
set clipboard+=unnamed

inoremap jj <Esc>

" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>
" TABにて対応ペアにジャンプ
nnoremap &lt;Tab&gt; %
vnoremap &lt;Tab&gt; %
" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" open shell
nmap <silent> vs :<C-u>VimShell<CR>
nmap <silent> vp :<C-u>VimShellPop<CR>
" nerdtree
nnoremap <silent><C-e> :NERDTreeToggle<CR>
" caw.vim
nmap <C-K> <Plug>(caw:i:toggle)
vmap <C-K> <Plug>(caw:i:toggle)

" NeoBundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('vim_starting')
  set nocompatible  " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
" filer
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'

" comment-out
NeoBundle "tyru/caw.vim.git"

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'itchyny/lightline.vim'
	let g:lightline = {
	      \ 'colorscheme': 'wombat',
        \ 'component': {
        \  'readonly': '%{&readonly?"x":""}',
        \ },
        \ 'separator': { 'left': '', 'right': '' },
        \ 'subseparator': { 'left': '|', 'right': '|' }
        \ }
  let g:gitgutter_sign_added = '✚'
  let g:gitgutter_sign_modified = '➜'
  let g:gitgutter_sign_removed = '✘'

NeoBundle 'Shougo/vimshell'

""""""""""""""""""""""""""""""""""""""""""" neocomplcache
NeoBundle 'Shougo/neocomplcache'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Townk/vim-autoclose'

NeoBundle 'Shougo/vimproc.vim', {
  \ 'build' : {
  \     'mac' : 'make -f make_mac.mak',
  \    }
  \ }

NeoBundleLazy 'Shougo/vimshell', {
  \ 'depends' : 'Shougo/vimproc',
  \ 'autoload' : {
  \   'commands' : [{ 'name' : 'VimShell', 'complete' : 'customlist,vimshell#complete'},
  \                 'VimShellExecute', 'VimShellInteractive',
  \                 'VimShellTerminal', 'VimShellPop'],
  \   'mappings' : ['<Plug>(vimshell_switch)']
  \ }}

" color theme
NeoBundle 'JavaScript-syntax'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'carlosvillu/coffeScript-VIM-Snippets'
NeoBundle 'tpope/vim-haml'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'pbrisbin/html-template-syntax'
NeoBundle 'joker1007/vim-markdown-quote-syntax'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'jQuery'
NeoBundle 'nginx.vim'
NeoBundle 'JSON.vim'
" NeoBundle ‘5t111111/neat-json.vim’
NeoBundle 'yuroyoro/vim-python'
NeoBundle 'yuroyoro/vim-scala'


NeoBundle 'nathanaelkane/vim-indent-guides'

call neobundle#end()



" Required:
filetype plugin indent on

NeoBundleCheck
