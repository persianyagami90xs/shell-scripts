# TYPE: Bash Shell script.
# PURPOSE: This bash shell script allows you to easily restore Ubuntu packages into a clean install of Lubuntu 12.04
# REQUIRES: Lubuntu 12.04 or newer, wget, apt-get
# Copyright (c) 2012-08-12 - Author: Mark Rijckenberg
# REVISION DATE: 20130405
# Updated by: markrijckenberg@gmail.com
PATH=/usr/sbin:/usr/bin:/sbin:/bin
#Prerequisites: USB drives SAMSUNG and IOMEGA need to be mounted correctly in order for this script to work correctly!

#define source directories
HOME=/home/ulysses/
SOURCE2=/etc/
SOURCE3=/media/windows/rsync/

#define target directories where backup will be stored
TARGET1=/media/SAMSUNG/$HOME/
TARGET2=/media/IOMEGA/$HOME/
TARGET3=/media/SAMSUNG/etc/
TARGET4=/media/IOMEGA/etc/
TARGET5=/media/SAMSUNG/media/windowsdata/rsync/
TARGET6=/media/IOMEGA/media/windowsdata/rsync/
#sudo /usr/bin/rsync -quvra   --exclude='.*' --exclude "$HOME.gvfs"  --max-size='100M' $TARGET1 $HOME 
#sudo /usr/bin/rsync -quvra   --exclude='.*' --exclude "$HOME.gvfs"  --max-size='100M' $TARGET2 $HOME
#sudo /usr/bin/rsync -quvra   --exclude='.*' --exclude "$HOME.gvfs"  --max-size='100M' $TARGET3 $SOURCE2
#sudo /usr/bin/rsync -quvra   --exclude='.*' --exclude "$HOME.gvfs"  --max-size='100M' $TARGET4 $SOURCE2 
# not required during restore: sudo /usr/bin/rsync -quvra   --exclude='.*' --exclude "$HOME.gvfs"  --max-size='100M' $TARGET5 $SOURCE3
# not required during restore: sudo /usr/bin/rsync -quvra   --exclude='.*' --exclude "$HOME.gvfs"  --max-size='100M' $TARGET6 $SOURCE3
# refresh list of available packages in Ubuntu repositories
sudo apt-get update
#sudo apt-get install dselect rsync -y
#sudo apt-key add $TARGET1/Repo.keys
sudo apt-key add Repo.keys
#sudo dpkg --set-selections < $TARGET1/Package.list
#sudo dpkg --set-selections < Package.list
#sudo dselect
# install list of packages defined in installedpackages file
sudo apt-get install  `cat  installedpackages`
# install Google Earth
wget http://dl.google.com/dl/earth/client/current/google-earth-stable_current_i386.deb
sudo dpkg -i google-earth-stable_current_i386.deb
