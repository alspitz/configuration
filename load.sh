#!/bin/bash

set -e

if [ ! -f "${HOME}/.vimrc" ]; then
  ln -s "$(pwd)/vimrc" "${HOME}/.vimrc"
else
  echo "${HOME}/.vimrc already exists. not overwriting. symlink manually".
fi

mkdir -p "${HOME}/.vim/undo"

cp mvlatest "${HOME}/.local/bin"
