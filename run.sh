#!/bin/bash

# Close all browsers before running this script.

# Firefox
find ~/Library/Application\ Support/Firefox/Profiles -name "places.sqlite" | while read path; do
  echo "Processing Firefox file '$path'"
  cat hosts | while read host
  do
    sqlite3 "$path" "DELETE FROM moz_places WHERE url LIKE '%$host%'";
    # TODO: remove from URL bar
    # TODO: remove cookies
  done
done

# Safari
echo "Processing Safari"
cat hosts | while read host
do
  sqlite3 ~/Library/Safari/History.db "DELETE FROM history_items WHERE url LIKE '%$host%'";
  # TODO: cleanup the history_visits by id
  # TODO: remove cookies
done

# Chrome
echo "Processing Chrome"
cat hosts | while read host
do
  sqlite3 ~/Library/Application\ Support/Google/Chrome/Default/History "DELETE FROM urls WHERE url LIKE '%$host%'";
  sqlite3 ~/Library/Application\ Support/Google/Chrome/Default/History "DELETE FROM segments WHERE name LIKE '%$host%'";
  sqlite3 ~/Library/Application\ Support/Google/Chrome/Default/Shortcuts "DELETE FROM omni_box_shortcuts WHERE url LIKE '%$host%'";
  sqlite3 ~/Library/Application\ Support/Google/Chrome/Default/Cookies "DELETE FROM cookies WHERE host_key LIKE '%$host%'";
  # TODO: remove from URL bar
  # TODO: cleanup the visits by id
done
