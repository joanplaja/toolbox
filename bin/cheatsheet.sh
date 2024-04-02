#!/bin/bash

git_cheatsheet() {
	echo "git reset --hard (HEAD~1|origin/develop) - Reset to (last commit|Origin branch)"
	echo "git revert (HEAD|(HEAD^|HEAD~N)..HEAD) - Revert (last commit|(last 2 commits|last N commits))"
}

redis_cheatsheet() {
	echo "redis-cli -h HOST_NAME - Connecting with cli to redis"
	echo "MONITOR - Realtime information about operations"
	echo "INFO keyspace - Get databases and its information"
	echo "SELECT database - Select a database to work on"
	echo "KEYS * - List all keys on the current database"
	echo "FLUSHDB - Delete all keys on the current database"
}

linux_cheatsheet() {
	case "$1" in
	debug)
		echo "strace (https://strace.io/)"
		echo "It is used to monitor and tamper with interactions between processes and the Linux kernel, which include system calls, signal deliveries, and changes of process state."
		echo "strace -p 26380 -- Attach to already running process"
		echo "strace -yy cat /dev/null -- Print paths and more info associated with file descriptors."
		echo "strace -c ls > /dev/null -- Count time, calls, and errors for each system call."
		;;
	grep)
		echo "grep 'pattern' <file> - Search for a pattern in a file"
		echo "grep -r 'pattern' <directory> - Recursively search for a pattern in a directory"
		echo "grep -i 'pattern' <file> - Perform case-insensitive search"
		echo "grep -v 'pattern' <file> - Invert match, display lines that do not match the pattern"
		;;
	network)
		echo "ifconfig - Show network interface configuration"
		echo "ping <host> - Send ICMP echo request to a host"
		echo "netstat - Display network connections, routing tables, etc."
		echo "traceroute <host> - Trace route to a host"
		;;
	*)
		echo "Usage: cheat linux {debug|grep|network}"
		;;
	esac

}

# Main function
cheat() {
	case "$1" in
	linux)
		linux_cheatsheet $2
		;;
	git)
		git_cheatsheet
		;;
	redis)
		redis_cheatsheet
		;;
	*)
		echo "Usage: $0 {linux{debug|grep|network}|git|redis}"
		;;
	esac
}
