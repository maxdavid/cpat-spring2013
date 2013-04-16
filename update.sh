#!/bin/bash
cd "$(dirname "${BASH_SOURCE}")"
set -e

MOTD=MOTD.txt
OLDLS="/tmp/old_listing"
NEWLS="/tmp/new_listing"

function getNewFiles() {
# Download and extract the tarball, excluding the files already here locally
  curl -#L https://github.com/pipecork/cpat-schoolwork/tarball/master \
  | tar -xzv --strip-components 1 --show-transformed --keep-old-files \
  --exclude={update.sh,README.md}
}

function getListing() {
# Returns the directory listing of every file currently in the directory
  LOCALFILES=$(find . -path ./.git -prune -o -name '*' \
             | sed 's/^\.\///g' \
             | sed "/\(^\.\)/ d" \
              )
}

function commitUpdate() {
# Add the new files into their own commit
  git add $1
  git commit -m"test commit" $1  
}

function updateFiles() {
# Compare the file listing before and after downloading new files to see if a
# new commit of updates is needed
  getListing
  echo "$LOCALFILES" | sort > $OLDLS  # Store the current ls in a file
  getNewFiles
  getListing
  echo "$LOCALFILES" | sort > $NEWLS  # Store the 'new' ls in a file
  DIFFLS=$(comm -13 $OLDLS $NEWLS)
  rm $OLDLS $NEWLS 2> /dev/null
  if [ ! -z $DIFFLS ]; then  # If we added any new files...
    commitUpdate "$DIFFLS"   # Then make a commit for them
  fi
  unset LOCALFILES DIFFLS
}

function motd() {
# Print the most recent motd ($1), then remove the file
  cat $1 | sed '/^#####/,$ d'
  #rm $1 2> /dev/null
}


# Main
if [ "$1" == "--force" -o "$1" == "-f" ]; then
  updateFiles
  motd $MOTD
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    updateFiles
    motd $MOTD
  fi
fi
unset updateFiles MOTD OLDLS NEWLS DIFFLS

