#!/bin/bash

echo "Dumping…"
./dump
echo "Importing data…"
./import-data.py

echo "Creating doc…"
cd doc/
. create.sh

tdir=/var/www/ds100
if [ -d "$tdir" ]; then
    echo "Copying data…"
    rsync -via output/ $tdir/
    chmod 664 $tdir/*.*
    chmod 664 $tdir/*/*.*
else
    echo "Not copying data"
fi

adir=/var/www/avatar
if [ -d "$adir" ]; then
    echo "Copying avatar…"
    chmod 664 ../avatar.svg
    cp ../avatar.svg $adir/ds100.svg
else
    echo "Not copying avatar"
fi
echo "Done"
