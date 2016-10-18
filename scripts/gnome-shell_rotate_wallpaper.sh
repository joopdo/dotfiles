# Script to randomly set Background from files in a directory

#while true;do
cd "/media/suna/large_disk/docs_backup/Photos and videos"
# Directory Containing Pictures -- EDIT THIS LINE 
DIR="/media/suna/large_disk/docs_backup/Photos and videos"

# Internal Field Separator set to newline, so file names with
# spaces do not break our script.
IFS='
'

# Command to Select a random jpg file from directory
PIC=$(find . -size +1M -print | grep -i '.*[.]jpg' | shuf -n1)
echo $DIR/$PIC
# Command to set Background Image
gsettings set org.gnome.desktop.background picture-uri "file://$DIR/$PIC"

# specify how long to wait in seconds between changes
#sleep 600

#done