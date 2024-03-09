#!/bin/bash

set -e

echo "Loading vimrc, bashrc, dircolor, setting up vim undo and mvlatest"

if [ ! -f "${HOME}/.vimrc" ]; then
  ln -s "$(pwd)/vimrc" "${HOME}/.vimrc"
else
  echo "${HOME}/.vimrc already exists. not overwriting. symlink manually".
fi

cp "${HOME}/.bashrc" "${HOME}/.bashrc.backup"
ln -sf "$(pwd)/bashrc" "${HOME}/.bashrc"

ln -sf "$(pwd)/dircolors" "${HOME}/.dircolors"

mkdir -p "${HOME}/.vim/undo"

mkdir -p "${HOME}/.local/bin"
cp mvlatest "${HOME}/.local/bin/"
