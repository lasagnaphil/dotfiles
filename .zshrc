# Created by newuser for 5.7.1

source ~/scripts/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle archlinux

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme agnoster

# Tell antigen that you're done.
antigen apply

# Now setup some aliases
alias clion=~/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/193.6494.38/bin/clion.sh
alias vim=nvim
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

# Environment variables related to PhysX
export PHYSX_HOME=/home/lasagnaphil/packages/PhysX/physx
export PXSHARED_HOME=/home/lasagnaphil/packages/PhysX/pxshared
