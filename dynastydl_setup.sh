#!/usr/bin/env bash

#check if running as root REQUIRED!!!!!
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "not root"
    exit
fi

#dynasty scans downloader setup file

echo "installing various tools..."

#Setting up various tools
npm install -g dynasty-dl
wget -P /usr/local/bin https://raw.githubusercontent.com/CyberSkull/cbz.sh/refs/heads/master/cbz.sh
chmod +x /usr/local/bin/cbz.sh

#variables
read -p "where do you want the library to be stored? Default: /home/$USER/library" LIBPATH
echo "$LIBPATH"

echo "starting dryrun..."

if [ -d "$LIBPATH" ]; then
  echo "creating directory..."
  mkdir %LIBPATH
fi

#dryrun
cd $LIBPATH
echo "downloading..."
dynasty-dl https://dynasty-scans.com/series/cotton_candy
cd "Cotton Candy"/
cbz.sh *

echo "dryrun complete!"
