#!/bin/bash
. /etc/lsb-release
OS=$DISTRIB_ID
VER=$DISTRIB_RELEASE

echo "We'll need sudo access."
sudo date
sudo add-apt-repository -y ppa:pi-rho/dev
sudo apt-get update
if [ $VER = "12.04" ]; then
    sudo apt-get install -y tmux=1.9a-1~ppa1~p
elif [ $VER = "14.04"]; then
    sudo apt-get install -y tmux=1.9a-1~ppa1~t
else
    sudo apt-get install -y tmux=1.9a-1~ppa1~s
fi

echo "Setting up directories..."
mkdir -p ~/.tmux/plugins

echo "Installing tmux-resurrect..."
git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/tmux-resurrect

(cd ~/.tmux/plugins/tmux-resurrect      && git pull --rebase)

echo "Setting up .tmux.conf..."
echo "unbind C-b
set -g prefix C-a
set -g default-terminal "xterm-256color"

run-shell '~/.tmux/plugins/tmux-resurrect/resurrect.tmux'" > ~/.tmux.conf

tmux source-file ~/.tmux.conf
