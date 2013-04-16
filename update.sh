#!/bin/bash
cd "$(dirname "${BASH_SOURCE}")"
set -e

MOTD=MOTD.txt
LOCALFILES=""
OLDLS="/tmp/old_listing"
NEWLS="/tmp/new_listing"
DIFFLS=""

function getNewFiles() {
# Download and extract the tarball, excluding the files already here locally
  curl -#L https://github.com/pipecork/cpat-schoolwork/tarball/master \
  | tar -xzv --strip-components 1 --show-transformed --keep-old-files --exclude=update.sh
}

function getListing() {
  # Returns the  path of every file currently in the directly (sans the folders 
  # themselves) as a single, comma-delimited string
  LOCALFILES=$(find . -path ./.git -prune -o -name '*' \
             | sed 's/^\.\///g' \
             | sed "/\(^\.\)/ d" \
              )
}

function commitUpdate() {
# Commit the new files into their own commit
  git commit -m"test commit" $1  
}

function updateFiles() {
# Download
  getListing
  echo "$LOCALFILES" | sort > $OLDLS
  getNewFiles
  getListing
  echo "$LOCALFILES" | sort > $NEWLS
  DIFFLS=$(comm -13 $OLDLS $NEWLS)
  rm $OLDLS 2> /dev/null
  rm $NEWLS 2> /dev/null
}

function motd() {
# Print the most recent motd ($1), then remove the file
  cat $1 | sed '/^#####/,$ d'
  #rm $1 2> /dev/null
}

# TODO
# commit the downloaded files in their own commit
# update the actual repo

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  updateFiles
  motd $MOTD
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    updateFiles
    # commitUpdate $DIFFLS
    motd $MOTD
  fi
fi
unset updateFiles motd
