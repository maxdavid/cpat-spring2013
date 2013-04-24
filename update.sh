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
#
# If passed with an argument, then it returns only the listings with filenames  
# that contain the given string (case-insensitive)
#   USAGE: getListing [FILENAME] [OPTION(S)]
#
#   OPTIONS:
#     --exclude-root / -er:  
#         Excludes files in the root dir (only works if a file name is given)
# TODO
# arg-checking should really be a loop
# -er doesn't work if a filename isn't given

  if [ "$1" == "--exclude-root" -o "$1" == "-er" ]; then
    EXCLUDINGROOT=0
    FILENAME=$2
  elif [ "$2" == "--exclude-root" -o "$2" == "-er" ]; then
    EXCLUDINGROOT=0
    FILENAME=$1
  else
    FILENAME=$1
  fi 
  # Get the listing, grep if file was given
  DIRLISTING=$(find . -path ./.git -prune -o -name '*' \
              | sed 's/^\.\///g' \
              | sed "/\(^\.\)/ d" \
              | grep --ignore-case "$FILENAME" \
              )
  if [ $EXCLUDINGROOT ]; then
  # Remove listing if in the root dir
    DIRLISTING=$(echo "$DIRLISTING" \
                | sed "/^$FILENAME$/ d" )
  fi
  unset FILENAME EXCLUDINGROOT
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
    rmByFileName TODO.md
    updateFiles
    motd $MOTD
  fi
fi
unset updateFiles MOTD OLDLS NEWLS DIFFLS

