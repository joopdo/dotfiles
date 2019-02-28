# Script to randomly set Background from files in a directory

while true;do
cd "/home/suna/datalarge/pictures"
# Directory Containing Pictures -- EDIT THIS LINE 
DIR="/home/suna/datalarge/pictures"

# Internal Field Separator set to newline, so file names with
# spaces do not break our script.
IFS='
'

# Command to Select a random jpg file from directory
PIC=$(find . -size +1M -print | grep -i '.*[.]jpg' | shuf -n1)
echo $DIR/$PIC
#"'file://$DIR/$PIC'"
PPATH="file://$DIR/$PIC"
# Command to set Background Image
echo "$PPATH"
#!dconf write /com/deepin/wrap/gnome/desktop/background/picture-uri "$PPATH"
gsettings set com.deepin.wrap.gnome.desktop.background picture-uri "$PPATH"

# specify how long to wait in seconds between changes
sleep 600

done
