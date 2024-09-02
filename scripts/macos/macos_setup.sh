#!/usr/bin/env bash

# This script is strongly inspired from: https://mths.be/macos

# Ask for administrator password upfront
sudo -v

# Close the Settings to avoid overriding errors
osascript -e "tell application 'System Preferences' to quit"

# Keep this script alive
while true; do
	sudo -n true
	sleep 60
	kill -0 "$$" || exit
done 2>/dev/null &

# TODO: Run other scripts

#############################
# Spotlight
#############################

# Load new settings before rebuilding the index
killall mds >/dev/null 2>&1

# Make sure indexing is enabled for the main volume
sudo mdutil -i on / >/dev/null

# Rebuild the index from scratch
sudo mdutil -E / >/dev/null

#############################
# Kill Affected Apps
#############################

for app in "Activity Monitor" \
	"Address Book" \
	"Calendar" \
	"cfprefsd" \
	"Contacts" \
	"Dock" \
	"Finder" \
	"Google Chrome" \
	"Mail" \
	"Messages" \
	"Photos" \
	"Safari" \
	"SystemUIServer" \
	"Terminal" \
	"iCal"; do
	killall "${app}" &>/dev/null
done
echo "Done. Might still need to restart."
