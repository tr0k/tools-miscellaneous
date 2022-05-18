#!/bin/sh

# Run example: ./kerberos_chrome_mac.sh cern.ch
# To verify chrome policies: chrome://policy/
# Restart of the webbrowser is needed too

adfs_alias="${1:-cern.ch}"
echo "${adfs_alias}"
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`
echo $loggedInUser

# Deprecated since Chrome 101 (at least)
#sudo -u $loggedInUser defaults write com.google.Chrome AuthServerWhitelist "*.${adfs_alias}"
#sudo -u $loggedInUser defaults write com.google.Chrome AuthNegotiateDelegateWhitelist "*.${adfs_alias}"

# New options to set up
sudo -u $loggedInUser defaults write com.google.Chrome AuthServerAllowlist "*.${adfs_alias}"
sudo -u $loggedInUser defaults write com.google.Chrome AuthNegotiateDelegateAllowlist "*.${adfs_alias}"

echo $(date)
exit 0
