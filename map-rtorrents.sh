#!/bin/bash 
## TheLinuxGirl
## Parse .torrent files to find associated filenames/mappings

torrent_dir=${HOME}/.config/rtorrent/session

## formatting ##
b=`tput bold` ## bold
n=`tput sgr0` ## normal

echo "${b}Checking .torrent file mappings in $torrent_dir${n}"

for file in ${torrent_dir}/*.torrent ; 
        do 
        echo ""
        echo "${b}FILE:${n} $file "
        echo -en "${b}TORRENT:${n} " 
        strings $file | head -1 | awk -F: '{print $(NF-3)}' 
done

