#!/bin/bash
# Install for [dotfiles](https://github.com/u1and0/dotfiles.git)

#git clone --recursive https://github.com/u1and0/dotfiles.git
for file in `ls -A ${HOME}/dotfiles`; do
    ln -fs ${HOME}/dotfiles/$file ${HOME}
done

rmdir ${HOME}/.config/ranger 2> /dev/null

for dir in `ls -A ${HOME}/dotfiles/.config`; do
    ln -fs ${HOME}/dotfiles/.config/$dir ${HOME}/.config
done

sudo chsh -s `which zsh` `whoami`
rm -rf ${HOME}/.git
