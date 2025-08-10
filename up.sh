#!/bin/bash
set -eo pipefail
##################################################################################################################
# Author    : Pedro Teodoro
# Github    : https://github.com/pt-kaos
##################################################################################################################
#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue
##################################################################################################################

tput setaf 6
echo "=============================================================="
echo "                    Updating $(basename $(pwd))"
echo "=============================================================="
tput sgr0

message="New update"

while getopts ":m:" opt; do
  case ${opt} in
    m )
      if [[ -n "$OPTARG" ]]; then
        message="$OPTARG"
      fi
      ;;
    \? )
      echo "Usage: $0 [-m <message>]"
      exit 1
      ;;
  esac
done

echo "====> Update the repo <===="

workdir=$(pwd)

cd x86_64
sh updaterepo.sh

cd $workdir

echo "====> git update <===="

git add --all .                           # Add every change to be pushed to git
git commit -m "$message"                  # Commit to local repository with a default message
branch=$(git rev-parse --abbrev-ref HEAD) # Get branch name origin or master
git push -u origin "$branch"              # Push the local files to github
# Below command will backup everything inside the project folder

tput setaf 6
echo "=============================================================="
echo "                    $(basename $0) done"
echo "=============================================================="
tput sgr0
echo
