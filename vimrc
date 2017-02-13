set nocompatible 
filetype off
let mapleader = ","

set backspace=2
"no backups since we are always in git (almost)
set nobackup
set nowritebackup
set noswapfile

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


"Let Vundle manage Vundle
"required
"run ':PluginInstall' to install all plugins
Bundle 'gmarik/vundle'

"my bundles here:
Bundle 'tpope/vim-fugitive'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-surround'

Bundle 'thoughtbot/vim-rspec'
Bundle 'benmills/vimux'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'pdbradley/vim-tmux-runner'

Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-rails.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/ZoomWin'
Bundle 'scrooloose/syntastic'
Bundle 'kana/vim-fakeclip'
Bundle 'ervandew/supertab'

"all this stuff below is for snippets
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
set runtimepath+=~/.vim/bundle/vim-snippets

"fakeclip settings
let g:fakeclip_terminal_multiplexer_type = 'tmux'


filetype plugin indent on  "required!


"Rspec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>* :call RunAllSpecs()<CR>
let g:rspec_command = 'call VimuxRunCommand("bundle exec rspec {spec}\n")'

"disable folding by default
set nofoldenable


"
let g:VtrPercentage = 50
let g:VtrOrientation = 'h'
let g:VtrClearOnReatach = 0
map <Leader>x :VtrSendFile<CR>

"tabs
map <C-t> <esc>:tabnew<CR>

"indentation matters...
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

set history=500

" syntax highlighting
syntax on 

" toggle between insert paste mode
set pastetoggle=<leader>p

" Customizations
set nocompatible
set showmatch
set relativenumber
set ruler "show cursor position all the time
set showcmd "display incomplete commands
set autowrite " hopefully this will save buffers when I switch out of them
set laststatus=2 " always show status line
set smarttab
set noincsearch
set incsearch
set guioptions-=m       " Can't remember :)
set guioptions-=T       " No toolbars
set guioptions-=r       " No scrollbars
set visualbell t_vb=    " Don't beep
set hidden              " Don't prompt to save when switching buffers

"Display extra whitespace
set list listchars=tab:»·,trail:·

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Switch between the last two files
nnoremap <leader>b <c-^>

"map zoomwin to leader z
nnoremap <leader>z :ZoomWin<CR>

" My Custom Mappings related to ctrl-p
" copied the idea for this from gary bernhardts vimrc
map <leader>gv :CtrlP app/views<cr>
map <leader>gf :CtrlP spec/factories<cr>
map <leader>gc :CtrlP app/controllers<cr>
map <leader>gm :CtrlP app/models<cr>
map <leader>gh :CtrlPT app/helpers<cr>
map <leader>gl :CtrlP lib<cr>

"rails vim quicker mappings
map <Leader>c :Rcontroller 
map <Leader>sc :RScontroller 
map <Leader>vc :RVcontroller 
map <Leader>m :Rmodel 
map <Leader>sm :RSmodel 
map <Leader>vm :RVmodel 

map <Leader>bb :!bundle install<cr>

"git mappings
map <Leader>git :Gstatus<CR>

"quick open for Dropbox and notes files
"map <Leader>dr :e ~/Dropbox<cr>
"map <Leader>pn :sp ~/Dropbox/work/notes/project-notes.txt<cr>
"map <Leader>ann :sp ~/Dropbox/work/notes/annoyances-notes.txt<cr>
"map <Leader>td :sp ~/Dropbox/work/notes/todo.txt<cr>


"these two lines help w search.  case ignored unless search string has
"uppercase anywhere
set ignorecase
set smartcase

"assume /g flag is on for search and replace
set gdefault
set bg=light

"highlight current line
colorscheme desert "desert, pablo
highlight NonText guibg=#060606

set cursorline
"hi CursorLine term=bold cterm=bold guibg=Grey40
hi CursorLine term=bold guibg=#222222 guibg=Grey40

"status line highlight
highlight StatusLine ctermfg=blue ctermbg=yellow

"rounds to the nearest indent point 
set shiftround

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

"make a little 5 line padding at top and bottom when scrolling
set scrolloff=5

augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

"get out of insert mode with a super seldom used character sequence
inoremap jj <ESC>

"no delay when hitting esc
set noesckeys


"map <leader>w to open a new vsplit and switch to it
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

"get to Ack quickly with leader a
nnoremap <leader>a :Ack 
"resize panel
nnoremap <leader>r :resize 10
nnoremap <leader>vr :vertical resize 25
"create anothe panel
nnoremap <leader>ss :split
nnoremap <leader>vss :vsplit

"searching for element on page will highlight search as you type then clear it
set incsearch
set showmatch
set hlsearch
"clears search results
nnoremap <leader><space> :noh<cr>

"use ag instead of ack with ack.vim; -i means case insensitive
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

let g:ackprg = 'ag -i --nogroup --nocolor --column --ignore-dir log --ignore-dir versions'

nnoremap <leader>find :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

nnoremap <leader>n :NERDTreeToggle<CR>

"move around your splits with ctrl hjkl which b/c capslock is assigned to ctrl
"works well
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

au BufReadPost *.dwt set syntax=html

"open up vim on the fly
nnoremap <leader>vim <C-w><C-v><C-l>:e $MYVIMRC<cr>

"relaods .vimrc file after saving automatically
au! BufWritePost .vimrc source %

