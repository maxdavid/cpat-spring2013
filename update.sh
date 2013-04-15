#!/bin/bash
cd "$(dirname "${BASH_SOURCE}")"

# The list of folders in the repo. need to exclude them... from the exclusion
FOLDERS='mlearning\|stats\|seminar\|project\|docs'
# Returns the  path of every file currently in the directly (sans the folders 
# themselves) as a single, comma-delimited string
LOCALFILES=$(find . -path ./.git -prune -o -name '*' \
           | sed 's/^.\///g' \
           | sed "/\(^.$\)\|^\($FOLDERS\)$/ d" \
           | sed ':a;N;$!ba;s/\n/,/g' \
           )

echo $LOCALFILES #debug

function updateFiles() {
  # Download and extract the tarball, excluding the files already here locally
  curl -#L https://github.com/pipecork/cpat-schoolwork/tarball/master | tar -xzv --strip-components 1 --show-transformed --exclude={'$LOCALFILES'}
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
