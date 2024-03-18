#!/bin/bash

# Function to display git cheat sheet
git_cheatsheet() {
	echo "Git Cheat Sheet:"
	echo "git reset --hard (HEAD~1|origin/develop) - Reset to (last commit|Origin branch)"
	echo "git revert (HEAD|(HEAD^|HEAD~N)..HEAD) - Revert (last commit|(last 2 commits|last N commits))"
}

# Function to display network commands cheat sheet
network_cheatsheet() {
	echo "Network Commands Cheat Sheet:"
	echo "ifconfig - Show network interface configuration"
	echo "ping <host> - Send ICMP echo request to a host"
	echo "netstat - Display network connections, routing tables, etc."
	echo "traceroute <host> - Trace route to a host"
}

# Function to display grep commands cheat sheet
grep_cheatsheet() {
	echo "Grep Commands Cheat Sheet:"
	echo "grep 'pattern' <file> - Search for a pattern in a file"
	echo "grep -r 'pattern' <directory> - Recursively search for a pattern in a directory"
	echo "grep -i 'pattern' <file> - Perform case-insensitive search"
	echo "grep -v 'pattern' <file> - Invert match, display lines that do not match the pattern"
}

# Main function
cheat() {
	case "$1" in
	git)
		git_cheatsheet
		;;
	network)
		network_cheatsheet
		;;
	grep)
		grep_cheatsheet
		;;
	*)
		echo "Usage: $0 {git|network|grep}"
		;;
	esac
}
