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
# Sets '$DIRLISTING' as a single, space delimited string of the directory 
# listing of everything, recursively, currently in the directory.
# If passed with an argument, then it returns only the listings with filenames  
# that contain the given string (case-insensitive)
  DIRLISTING=$(find . -path ./.git -prune -o -name '*' \
              | sed 's/^\.\///g' \
              | sed "/\(^\.\)/ d" \
              | grep --ignore-case "$1" \
              )
}

function commitUpdate() {
# Add the new files into their own git commit. 
# Both variables should be passed in quotes:
# $1 -- Commit message
# $2 -- List of files to commit 
    # Each file MUST be separated by a space in a single string in quotes
  git add $2
  git commit -m"$1" $2 
}

function rmTODOs() {
# Removes TODO.md files in every class directory. 
# This excludes any in the root directory.
  getListing "TODO.md"
  DIRLISTING=$(echo "$DIRLISTING" \
              | sed '/^TODO.md$/ d'
              )
  rm $DIRLISTING 2> /dev/null
  unset DIRLISTING
}

function updateFiles() {
# Compare the file listing before and after downloading new files to see if a
# new commit of updates is needed
  getListing
  echo "$DIRLISTING" | sort > $OLDLS  # Store the current ls in a file
  getNewFiles
  getListing
  echo "$DIRLISTING" | sort > $NEWLS  # Store the 'new' ls in a file
  DIFFLS=$(comm -13 $OLDLS $NEWLS)
  rm $OLDLS $NEWLS 2> /dev/null
  echo "$DIFFLS"
  if [ ! -z "$DIFFLS" ]; then  # If we added any new files...
    commitUpdate "Updated files $(date '+%m/%d/%y')" "$DIFFLS"  # Then make a commit for them
  fi
  unset DIRLISTING DIFFLS
}

function motd() {
# Print the most recent motd ($1), then remove the file
  cat $1 | sed '/^#####/,$ d'
  #rm $1 2> /dev/null
}


# Main
if [ "$1" == "--merge" -o "$1" == "-m" ]; then
  if ! git remote -v | grep -q "upstream" ; then
    git remote add upstream git@github.com:pipecork/cpat-spring2013.git
  fi
  git fetch upstream
  git checkout master
  git merge upstream/master
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    rmTODOs
    updateFiles
    motd $MOTD
  fi
fi
unset updateFiles MOTD OLDLS NEWLS DIFFLS

