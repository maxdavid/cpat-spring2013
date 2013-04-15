#!/bin/bash
cd "$(dirname "${BASH_SOURCE}")"
set -e

function updateFiles() {
  # Download and extract the tarball, excluding the files already here locally
  curl -#L https://github.com/pipecork/cpat-schoolwork/tarball/master \
  | tar -xzv --strip-components 1 --show-transformed --keep-old-files --exclude={README.md}
}

function motd() {
  # Print the most recent motd, then remove the file
  cat MOTD.md | sed '/^#####/,$ d'
  rm MOTD.md 2> /dev/null
}

# TODO
# commit the downloaded files in their own commit
# update the actual repo

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  updateFiles
  motd
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    updateFiles
    motd
  fi
fi
unset updateFiles motd
