#!/bin/zsh
# Intalling my dotfiles script

# Download dotfiles
git clone --depth 3 -b feature/pyenv\
    https://github.com/u1and0/dotfiles.git ${HOME}/dotfiles &&
    ${HOME}/dotfiles/.install/install.zsh


# Cloning & Replacing dotfiles
printf "\n!!! Replace all dotfles in HOME directory? !!! [y/N]: "
if read -q; then; echo
    mv ${HOME}/dotfiles/.git ${HOME} &&
        git reset --hard &&
            rm -rf dotfiles
    git submodule update --init --recursive ${HOME}
fi


# Restore my archlinux packages using `bacpac`
printf "\nRestore whole packages managed by pacman? [y/N]: "
if read -q; then; echo
    ${HOME}/bacpac/bacpac restore
fi


# Install python using `pyenv`
printf "\nInstall my python environment? [y/N]: "
if read -q; then; echo
    source ${HOME}/.pyenvrc
    pyenv install miniconda3-latest

    # Restore my python packages
    conda env create --file ${HOME}/.install/snow-packages.yml
fi
# -----------------------------
# if not yml file, backup first
# `conda env export > snow-packages.yml`
#
# prefix <name>-packages.yml named to conda-env name
# same as
# `conda create -n <name>`
# -----------------------------


# Change user shell
printf "\nChange default shell to zsh? [y/N]: "
if read -q; then; echo
    type zsh &&
        sudo chsh `whoami` -s /usr/bin/zsh &&
            printf "\nrelogin\n"; /usr/bin/zsh -l
fi
