#!/bin/bash
cd ~
git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt
echo "ADD THIS TO YOUR .bashrc: source ~/.bash-git-prompt/gitprompt.sh"
source ~/.bash-git-prompt/gitprompt.sh

cd "$(dirname "$0")"

echo "Setting up directories..."
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors ~/.vim/syntax
cd ~/.vim

echo "Downloading and installing pathogen..."
curl -LSso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

echo "Downloading and installing Twilight theme..."
curl -LSso ~/.vim/colors/twilight256.vim http://www.vim.org/scripts/download_script.php?src_id=14937

echo "Downloading and installing Molokai theme..."
curl -LSso ~/.vim/colors/molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim

echo "Downloading and installing syntaxes..."
curl -LSso ~/.vim/syntax/less.vim http://leafo.net/lessphp/vim/less.vim

echo "Setting up .vimrc..."
echo "
\" Use Vim settings, rather then Vi settings (much better!).
\" This must be first, because it changes other options as a side effect.
set nocompatible

\" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
\" source ~/.vimrc.before if it exists.
if filereadable(expand(\"~/.vimrc.before\"))
  source ~/.vimrc.before
endif

\" ================ General Config ====================

set number                      \"Line numbers are good
set backspace=indent,eol,start  \"Allow backspace in insert mode
set history=1000                \"Store lots of :cmdline history
set showcmd                     \"Show incomplete cmds down the bottom
set showmode                    \"Show current mode down the bottom
set gcr=a:blinkon0              \"Disable cursor blink
set visualbell                  \"No sounds
set autoread                    \"Reload files changed outside vim

\" This makes vim act like all other editors, buffers can
\" exist in the background without being in a window.
\" http://items.sjbach.com/319/configuring-vim-right
set hidden

\"turn on syntax highlighting
syntax on

\" Change leader to a comma because the backslash is too far away
\" That means all \\x commands turn into ,x
\" The mapleader has to be set before vundle starts loading all
\" the plugins.
let mapleader=\",\"

\" =============== Pathogen Initialization ===============
execute pathogen#infect()

\" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

\" ================ Persistent Undo ==================
\" Keep undo history across sessions, by storing in file.
\" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

\" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

\" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       \"Don't wrap lines
set linebreak    \"Wrap lines at convenient points

\" ================ Completion =======================

set wildmode=list:longest
set wildmenu                \"enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ \"stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

\"
\" ================ Scrolling ========================

set scrolloff=8        \"Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

\" ================ Search ===========================

set incsearch       \" Find the next match as we type the search
set hlsearch        \" Highlight searches by default
set ignorecase      \" Ignore case when searching...
set smartcase       \" ...unless we type a capital

\" ================ My Stuff =========================

nmap <silent> \`<Up> :wincmd k<CR>
nmap <silent> \`<Down> :wincmd j<CR>
nmap <silent> \`<Left> :wincmd h<CR>
nmap <silent> \`<Right> :wincmd l<CR>
inoremap <Nul> <C-p>

let g:ctrlp_follow_symlinks = 1
let g:rehash256 = 1
\"let g:jsx_ext_required = 0
\"let g:jsx_pragma_required = 1
let g:netrw_liststyle=3

let g:syntastic_ignore_files = ['\.py$']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

colorscheme molokai

filetype plugin indent on

au BufNewFile,BufRead *.less set filetype=less.css

autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType js :setlocal sw=2 ts=4 sts=2
autocmd FileType scss :setlocal sw=2 ts=2 sts=2
autocmd FileType less :setlocal sw=2 ts=2 sts=2
autocmd FileType html :setlocal sw=2 ts=2 sts=2" > ~/.vimrc

echo "Installing jshint..."
npm install -g jshint

echo "Installing plugins..."
git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
git clone git://github.com/airblade/vim-gitgutter.git ~/.vim/bundle/vim-gitgutter
git clone git://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
git clone git://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
git clone git://github.com/nathanaelkane/vim-indent-guides.git ~/.vim/bundle/vim-indent-guides
git clone git://github.com/pangloss/vim-javascript.git ~/.vim/bundle/vim-javascript
git clone git://github.com/mxw/vim-jsx.git ~/.vim/bundle/vim-jsx
git clone git://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic
git clone git://github.com/tomtom/tlib_vim.git ~/.vim/bundle/tlib_vim
git clone git://github.com/MarcWeber/vim-addon-mw-utils.git ~/.vim/bundle/vim-addon-mw-utils
git clone git://github.com/garbas/vim-snipmate.git ~/.vim/bundle/vim-snipmate
git clone git://github.com/honza/vim-snippets.git ~/.vim/bundle/vim-snippets

(cd ~/.vim/bundle/vim-fugitive        && git pull --rebase)
(cd ~/.vim/bundle/vim-gitgutter       && git pull --rebase)
(cd ~/.vim/bundle/ctrlp.vim           && git pull --rebase)
(cd ~/.vim/bundle/vim-airline         && git pull --rebase)
(cd ~/.vim/bundle/vim-indent-guides   && git pull --rebase)
(cd ~/.vim/bundle/vim-jsx             && git pull --rebase)
(cd ~/.vim/bundle/vim-javascript      && git pull --rebase)
(cd ~/.vim/bundle/syntastic           && git pull --rebase)
(cd ~/.vim/bundle/tlib_vim            && git pull --rebase)
(cd ~/.vim/bundle/vim-addon-mw-utils  && git pull --rebase)
(cd ~/.vim/bundle/vim-snipmate        && git pull --rebase)
(cd ~/.vim/bundle/vim-snippets        && git pull --rebase)
