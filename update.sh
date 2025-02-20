#!/bin/bash

# here be dragons
# also, poorly written slop

cd "$(dirname "${BASH_SOURCE}")"
#set -e

UPSTREAMGIT=git@github.com:pipecork/cpat-spring2013.git
UPSTREAMTARBALL=https://github.com/pipecork/cpat-spring2013/tarball/master
MOTDRAWURL=https://raw.github.com/pipecork/cpat-spring2013/master/MOTD.txt
MOTD=MOTD.txt
OLDLS="/tmp/old_listing"
NEWLS="/tmp/new_listing"
UNNEEDEDFILES=( "README.md" "LICENSE.txt" $MOTD )  # Unnecessary files that aren't committed

function getNewFiles() {
# Download and extract the tarball, excluding the files already here locally
  curl -#L $UPSTREAMTARBALL \
  | tar -xzv --strip-components 1 --show-transformed --keep-old-files \
  --exclude={update.sh,README.md,LICENSE.txt}
}

function getListing() {
# Sets '$DIRLISTING' as a single, space delimited string of the directory 
# listing of everything, recursively, currently in the directory.
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

function getOverwrites() {
# Get the list of files which will be overwritten by the script.
  getListing --exclude-root TODO.md
  if [ ! -e $MOTD ]; then
    wget --output-document=$MOTD $MOTDRAWURL &> /dev/null
  fi
  OVERWRITES=$(cat "$MOTD" | sed '/^#####/,$ d' \
              | grep ">>>>>OVERWRITE" \
              | sed 's/^>>>>>OVERWRITE //g' \
              | sed 's/\s\+/\n/g' \
              )
  OVERWRITES="$DIRLISTING $OVERWRITES"
  rm $MOTD &> /dev/null
  unset DIRLISTING
}

function commitUpdate() {
# Add the new files into their own git commit. 
# Both variables should be passed in quotes:
# $1 -- Commit message
# $2 -- List of files to commit 
    # Each file MUST be separated by a space in a single string in quotes
# Files specified in $UNNEEDEDFILES are removed from repo

  CMESSAGE=$1
  NEWFILES=$2
  RMFILES=""

  for i in "${UNNEEDEDFILES[@]}"; do
    if [ -e $i ]; then
      git rm $i &> /dev/null
      rm $i &> /dev/null
      RMFILES=$RMFILES$" "$i
    fi
  done

  git add $NEWFILES $OVERWRITES
  git commit -m"$CMESSAGE" $NEWFILES $OVERWRITES $RMFILES
  unset CMESSAGE NEWFILES RMFILES
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
  unset DIRLISTING
}

function motd() {
# Print the most recent motd at ($MOTD), then remove the file
  if [ ! -e $MOTD ]; then
    wget --output-document=$MOTD $MOTDRAWURL &> /dev/null
  fi
  cat $MOTD | sed '/^#####/,$ d' | sed '/^>>>>>OVERWRITE/ d' 2> /dev/null
  rm $MOTD 2> /dev/null
}



function DoIt() {
# Just do it. Runs everything that the script needs to do
  rm $OVERWRITES 2> /dev/null
  updateFiles
  commitUpdate "Updated files $(date '+%m/%d/%y')" "$DIFFLS"  # Make a commit for them
  motd
}


# Main
if [ "$1" == "--merge" -o "$1" == "-m" ]; then  # If you're no stranger to merge conflicts
  motd
  if ! git remote -v | grep -q "upstream" ; then
    git remote add upstream $UPSTREAMGIT
  fi
  git fetch upstream
  git checkout master
  git merge upstream/master
elif [ "$1" == "--force" -o "$1" == "-f" ]; then  # If you live on the edge
  getOverwrites
  DoIt
else
  getOverwrites
  echo "The following files will be overwritten:"
  echo $OVERWRITES | sed 's/\s\+/\n/g'
  echo
  read -p "Are you sure? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    DoIt
  else
    motd
  fi
fi
unset UPSTREAMGIT UPSTREAMTARBALL MOTDRAWURL MOTD OLDLS NEWLS DIRLISTING OVERWRITES DIFFLS

