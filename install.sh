#!/bin/bash
####################
# install.sh
# Creates symlinks in the home directory to any dotfiles in ~/dotfiles
####################

### Variables

DIR=~/dotfiles
OLDDIR=~/dotfiles.old
FILES="bashrc vscode emacs.d doom.d config"

###

# create dotfiles.old in homedir
echo "Creating $OLDDIR for backup of any existing dotfiles in ~"
mkdir -p $OLDDIR
echo "...done"

# change to the dotfiles directory
echo "Changing to the $DIR directory"
cd $DIR
echo "...done"

# move any existing dotfiles in homedir to dotfiles.old directory, then create symlinks
for file in $FILES; do
    echo "Moving any existing dotfiles from ~ to $OLDDIR"
    mv ~/.$file $OLDDIR/
    echo "Creating symlink to $file in home directory."
    ln -s $DIR/$file ~/.$file
done
