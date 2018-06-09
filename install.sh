#!/bin/sh
# For intalling my dotfiles

# At first type mannually command below
# git clone https://github.com/u1and0/dotfiles.git

# Cloning & Replacing
mv ${HOME}/dotfiles/.git ${HOME} &&
    git reset --hard &&
        rm -rf dotfiles
git submodule update --init --recursive &&

# Change user shell
sudo chsh `whoami` -s `which zsh` &&
    eval $SHELL -l

# Restore my archlinux packages
# ${HOME}/bacpac/bacpac restore

# Install python
# source ${HOME}/.pyenvrc
# pyenv install miniconda3-latest

# Restore python packages
# conda env create --file ${HOME}/snow-packages.yml 
# if not yml file, backup first
# for creating backup file command
#
# `conda env export > snow-packages.yml`
#
# prefix ***-packages.yml name to
# create environment name
