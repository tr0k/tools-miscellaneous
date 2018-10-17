#!/bin/sh
adfs_alias=
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`
echo $loggedInUser
sudo -u $loggedInUser defaults write com.google.Chrome AuthServerWhitelist "${adfs_aliast}"
sudo -u $loggedInUser defaults write com.google.Chrome AuthNegotiateDelegateWhitelist "${adfs_alias}"
echo $(date)
exit 0

# To verify chrome policies: chrome://policy/
