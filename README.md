# pornDeleter
Deletes porn from firefox history. Only compatible with firefox

A simple shell script that checks firefox history against list of sites and deletes any matching entries. I compiled a list of all the pornsites I could find.
Preferably to be run on a crontab

____________
Requirements:
firefox
sqlite3
____________
Instructions:
Change the value DBPATH to your places.sqlite file.

Usually located in /home/USER/.mozilla/firefox/USERID/places.sqlite

To add a custom site to the list, just make a new line in the hosts file
____________





