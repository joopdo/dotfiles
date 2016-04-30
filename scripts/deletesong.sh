audtool --playlist-advance
mv "$(audtool --playlist-song-filename $(expr $(audtool --playlist-position) - 1))" /media/large_disk/Docs_notbackup/thrownmusic
audtool --playlist-delete $(expr $(audtool --playlist-position) - 1)
