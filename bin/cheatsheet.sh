#!/bin/bash

# Function to display git cheat sheet
git_cheatsheet() {
	echo "git reset --hard (HEAD~1|origin/develop) - Reset to (last commit|Origin branch)"
	echo "git revert (HEAD|(HEAD^|HEAD~N)..HEAD) - Revert (last commit|(last 2 commits|last N commits))"
}

# Function to display network commands cheat sheet
network_cheatsheet() {
	echo "ifconfig - Show network interface configuration"
	echo "ping <host> - Send ICMP echo request to a host"
	echo "netstat - Display network connections, routing tables, etc."
	echo "traceroute <host> - Trace route to a host"
}

# Function to display grep commands cheat sheet
grep_cheatsheet() {
	echo "grep 'pattern' <file> - Search for a pattern in a file"
	echo "grep -r 'pattern' <directory> - Recursively search for a pattern in a directory"
	echo "grep -i 'pattern' <file> - Perform case-insensitive search"
	echo "grep -v 'pattern' <file> - Invert match, display lines that do not match the pattern"
}

# Function to display redis commands cheat sheet
redis_cheatsheet() {
	echo "redis-cli -h HOST_NAME - Connecting with cli to redis"
	echo "MONITOR - Realtime information about operations"
	echo "INFO keyspace - Get databases and its information"
	echo "SELECT database - Select a database to work on"
	echo "KEYS * - List all keys on the current database"
	echo "FLUSHDB - Delete all keys on the current database"
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
	redis)
		redis_cheatsheet
		;;
	*)
		echo "Usage: $0 {git|network|grep}"
		;;
	esac
}
