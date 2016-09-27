#!/bin/bash

# Defining firefox database 
DBPATH="/home/daniel/.mozilla/firefox/10qsq47v.default/places.sqlite";

#for each line in hosts file, check firefox history database for matching url and delete it
cat hosts | while read line
do
   sqlite3 $DBPATH "DELETE FROM moz_places WHERE url LIKE '%$line%'";
done


