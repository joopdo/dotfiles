#!/bin/bash
find .   -iname "*.sync-conflict-*" -print0 | while IFS= read -r -d '' scfile; do

echo ""
echo "===="

FILESIZE=$(stat -c%s "$scfile")

ORIGINALNAME=${scfile::-34}
extension="${scfile##*.}"
echo $ORIGINALNAME
BASENAME=$ORIGINALNAME"."$extension

BASENAMESIZE=$(stat -c%s "$BASENAME")
echo "SYNC CONF SIZE +$FILESIZE "
echo "BASNAME FILE S +$BASENAMESIZE"
if [ "$FILESIZE" ]; then

	if [ $FILESIZE -gt $BASENAMESIZE ]; then
		echo "deleting original"
		echo "$BASENAME"
		mv "$BASENAME" /media/large_disk/Docs_notbackup/tobedeleted
		#move syncconflict over original
		mv "$scfile" "$BASENAME"
else
		echo "deleting syncconfig file"
		mv "$scfile" /media/large_disk/Docs_notbackupt/tobedeleted
fi
fi
done
