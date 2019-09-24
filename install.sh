#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

# Entry point
dir=~/dotfiles # dotfiles directory
olddir=$dir/dotfiles_old # old dotfiles backup directory
files="vimrc tmux.conf bash_aliases gitconfig" # list of files/folders to symlink in homedir

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir &> /dev/null  #Cannot stat errors are ok, it means old dotfiles did not exist
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# Install Vundle and TPM
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
