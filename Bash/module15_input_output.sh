#!/bin/bash
read -p "Specify output file: " FILE

cat << EOF > $FILE
An old silent pond...
A frog jumps into the pond,
splash! Silence again.

Autumn moonlight-
a worm digs silently
into the chestnut.

In the twilight rain
these brilliant-hued hibiscus -
A lovely sunset.
EOF

cat < $FILE >/dev/null
echo Task finished >&2>stderr 
