# Script to randomly set Background from files in a directory

while true;do
cd "/home/suna/Pictures/"
# Directory Containing Pictures -- EDIT THIS LINE 
DIR="/home/suna/Pictures/"

# Internal Field Separator set to newline, so file names with
# spaces do not break our script.
IFS='
'

# Command to Select a random jpg file from directory
PIC=$(find . -size +1M -print | grep -i '.*[.]jpg' | shuf -n1)
echo $DIR/$PIC
PPATH="file://$DIR/$PIC"
# Command to set Background Image
gsettings set org.mate.background picture-filename $DIR/$PIC
#gsettings set com.deepin.wrap.gnome.desktop.background picture-uri "$PPATH"
# specify how long to wait in seconds between changes
sleep 6000

done
