#!/bin/bash

mac() {
	echo "Executing command 1..."
}

nvim() {
	echo "Executing command 2..."
}

main() {
	case "$1" in
	mac)
		mac
		;;
	nvim)
		nvim
		;;
	*)
		echo "Usage: $0 {mac|nvim}"
		exit 1
		;;
	esac
}

main "$@"
