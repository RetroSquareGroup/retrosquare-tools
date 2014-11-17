#!/bin/bash
echo "Setting up directories..."
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors ~/.vim/syntax
cd ~/.vim

echo "Downloading and installing pathogen..."
curl -LSso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

#echo "Downloading and installing Twilight theme..."
#curl -LSso ~/.vim/colors/twilight256.vim http://www.vim.org/scripts/download_script.php?src_id=14937

echo "Downloading and installing Molokai theme..."
curl -LSso ~/.vim/colors/molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim

echo "Downloading and installing syntaxes..."
curl -LSso ~/.vim/syntax/less.vim http://leafo.net/lessphp/vim/less.vim

echo "Setting up .vimrc..."
echo "execute pathogen#infect()
syntax on

set number
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set autoread
set nowrap
set paste

nmap <silent> \`<Up> :wincmd k<CR>
nmap <silent> \`<Down> :wincmd j<CR>
nmap <silent> \`<Left> :wincmd h<CR>
nmap <silent> \`<Right> :wincmd l<CR>
inoremap <Nul> <C-p>

let g:ctrlp_follow_symlinks = 1
let g:rehash256 = 1
let g:jsx_ext_required = 0
let g:jsx_pragma_required = 1
let g:netrw_liststyle=3

colorscheme molokai

filetype plugin indent on

au BufNewFile,BufRead *.less set filetype=less

autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType js :setlocal sw=2 ts=2 sts=2
autocmd FileType scss :setlocal sw=2 ts=2 sts=2
autocmd FileType less :setlocal sw=2 ts=2 sts=2
autocmd FileType html :setlocal sw=2 ts=2 sts=2" > ~/.vimrc

echo "Installing plugins..."
git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
git clone git://github.com/airblade/vim-gitgutter.git ~/.vim/bundle/vim-gitgutter
git clone git://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
git clone git://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
git clone git://github.com/vitalk/vim-lesscss.git ~/.vim/bundle/vim-lesscss
git clone git://github.com/nathanaelkane/vim-indent-guides.git ~/.vim/bundle/vim-indent-guides
git clone git://github.com/mxw/vim-jsx.git ~/.vim/bundle/vim-jsx
git clone git://github.com/pangloss/vim-javascript.git ~/.vim/bundle/vim-javascript

(cd ~/.vim/bundle/vim-fugitive      && git pull --rebase)
(cd ~/.vim/bundle/vim-gitgutter     && git pull --rebase)
(cd ~/.vim/bundle/ctrlp.vim         && git pull --rebase)
(cd ~/.vim/bundle/vim-airline       && git pull --rebase)
(cd ~/.vim/bundle/vim-lesscss       && git pull --rebase)
(cd ~/.vim/bundle/vim-indent-guides && git pull --rebase)
(cd ~/.vim/bundle/vim-jsx           && git pull --rebase)
(cd ~/.vim/bundle/vim-javascript    && git pull --rebase)
