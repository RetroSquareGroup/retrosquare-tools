#!/bin/bash
echo "Setting up directories..."
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors ~/.vim/syntax
cd ~/.vim

echo "Downloading and installing pathogen..."
curl -LSso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

echo "Downloading and installing Twilight theme..."
curl -LSso ~/.vim/colors/twilight256.vim http://www.vim.org/scripts/download_script.php?src_id=14937

echo "Downloading and installing syntaxes..."
curl -LSso ~/.vim/syntax/less.vim http://leafo.net/lessphp/vim/less.vim

echo "Setting up .vimrc..."
echo "execute pathogen#infect()
syntax on

set number
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set autoread

let g:lesscss_save_to = '../css/'

colorscheme twilight256

filetype plugin indent on

au BufNewFile,BufRead *.less set filetype=less

autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType html :setlocal sw=2 ts=2 sts=2" > ~/.vimrc

echo "Installing plugins..."
git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
git clone git://github.com/airblade/vim-gitgutter.git ~/.vim/bundle/vim-gitgutter
git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
git clone git://github.com/vitalk/vim-lesscss.git ~/.vim/bundle/vim-lesscss
