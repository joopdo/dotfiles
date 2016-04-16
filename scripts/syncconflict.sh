#!/bin/bash
find .   -iname "*.sync-conflict-*" -print0 | while IFS= read -r -d '' scfile; do

echo ""
echo "===="

FILESIZE=$(stat -c%s "$scfile")

ORIGIONALNAME=${scfile::-34}
extension="${scfile##*.}"
echo $ORIGIONALNAME
BASENAME=$ORIGIONALNAME"."$extension

BASENAMESIZE=$(stat -c%s "$BASENAME")
echo "SYNC CONF SIZE +$FILESIZE "
echo "BASNAME FILE S +$BASENAMESIZE"
if [ "$FILESIZE" ]; then

	if [ $FILESIZE -gt $BASENAMESIZE ]; then
		echo "deleting origional"
		echo "$BASENAME"
		mv "$BASENAME" /media/large_disk/Docs_notbackup/tobedeleted
		#move syncconflict over origional
		mv "$scfile" "$BASENAME"
else
		echo "deleting syncconfig file"
		mv "$scfile" /media/large_disk/Docs_notbackupt/tobedeleted
fi
fi
done
