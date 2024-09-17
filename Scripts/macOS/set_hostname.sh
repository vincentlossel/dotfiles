#!/usr/bin/env bash

hostname=$(scutil --get LocalHostName)
normal_hostname=$(echo "$hostname" | sed 's/-[0-9]*$//')

# Because macOS will add random numbers to the hostname (for whatever reason)
if [ "$normal_hostname" != "$hostname" ]; then
	echo "Changing hostname from $hostname to $normal_hostname"

	sudo scutil --set ComputerName "$normal_hostname"
	sudo scutil --set HostName "$normal_hostname"
	sudo scutil --set LocalHostName "$normal_hostname"
fi
