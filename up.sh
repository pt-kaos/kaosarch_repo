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

# variables and functions
workdir=$(pwd)
#dir="calamares-3.3.14-01"
#source=" /home/pedro/Programing/ArchISOs/KaosArch/kaosarch-pkgbuild/"
#destiny="/home/pedro/Programing/ArchISOs/KaosArch/kaosarch-calamares-config/etc/calamares/pkgbuild/"
#
###################################################################################################################
#
#rm -r $destiny*
#cp -r $source$dir/* $destiny

cd x86_64
sh updaterepo.sh

# Below command will backup everything inside the project folder
git add --all .

# Committing to the local repository with a message containing the time details and commit text

git commit -m "update"

# Push the local files to github

branch=$(git rev-parse --abbrev-ref HEAD)
git push -u origin "$branch"

echo
tput setaf 6
echo "##############################################################"
echo "###################  $(basename $0) done"
echo "##############################################################"
tput sgr0
echo
