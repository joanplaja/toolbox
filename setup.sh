#!/bin/bash

mac() {
	# Check if Homebrew is installed
	if ! command -v brew &>/dev/null; then
		echo "Homebrew is not installed. Please install Homebrew: https://brew.sh/"
		exit 1
	fi

	# Install Ansible via Homebrew
	brew install ansible

	# Download and unzip the toolbox repository
	mkdir -p ~/Downloads/toolbox
	curl -sSL https://github.com/joanplaja/toolbox/archive/refs/heads/main.zip -o ~/Downloads/toolbox/main.zip
	unzip -qq ~/Downloads/toolbox/main.zip -d ~/Downloads/toolbox/
	cd ~/Downloads/toolbox/toolbox-main || exit 1

	# Execute Ansible playbook
	ansible-playbook -vvv computer.yml --check

	rm -rf ~/Downloads/toolbox
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
