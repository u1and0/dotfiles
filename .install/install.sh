#!/bin/zsh
# Intalling my dotfiles script
#
# Type below command mannually
# ```
# git clone https://github.com/u1and0/dotfiles.git ~/dotfiles
# && ~/dotfiles/.install/install.sh
# ```


# Cloning & Replacing dotfiles
printf "!!! Replace all dotfles in HOME directory? !!! [y/N]: \n"
if read -q; then
    mv ${HOME}/dotfiles/.git ${HOME} &&
        git reset --hard &&
            rm -rf dotfiles
    git submodule update --force --init --recursive ${HOME}
fi


# Restore my archlinux packages
printf "Restore whole packages managed by pacman?[y/N]: \n"
if read -q; then
    ${HOME}/bacpac/bacpac restore
fi


# Install python using pyenv
printf "Install my python environment?[y/N]: \n"
if read -q; then
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
printf "Change default shell to zsh?[y/N]: \n"
if read -q; then
    type zsh && chsh `whoami` -s /usr/bin/zsh
        && printf "\nRelogin\n"; eval $SHELL -l
fi
