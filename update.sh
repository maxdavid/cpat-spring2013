#!/bin/bash
cd "$(dirname "${BASH_SOURCE}")"

function updateFiles() {
  # Download and extract the tarball, excluding the files already here locally
  curl -#L https://github.com/pipecork/cpat-schoolwork/tarball/master | tar -xzv --strip-components 1 --show-transformed --keep-old-files
}

# TODO
# commit the downloaded files in their own commit
# implement motd
# update the actual repo

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  updateFiles
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    updateFiles
  fi
fi
unset updateFiles
