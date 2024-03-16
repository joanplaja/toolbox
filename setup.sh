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
	# Specify the operating system (e.g., debian, alpine, ubuntu)
	local os="$1"

	# Download the nvim configuration folder
	case "$os" in
	debian | ubuntu)
		apt-get update && apt-get install -y curl git tar ninja-build gettext cmake unzip build-essential
		# Install neovim
		git clone https://github.com/neovim/neovim
		cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
		git checkout v0.9.5
		make
		make install
		mv build/bin/nvim /usr/bin/
		# Configure my nvim configuration
		mkdir -p ~/.config/nvim
		curl -sSL https://github.com/joanplaja/toolbox/archive/refs/heads/main.tar.gz | tar xz -C ~/.config/ --strip-components=2 toolbox-main/nvim
		;;
	*)
		echo "Unsupported operating system: $os"
		exit 1
		;;
	esac
}

main() {
	local command="$1"
	local os="$2"
	case "$command" in
	mac)
		mac
		;;
	nvim)
		nvim $os
		;;
	*)
		echo "Usage: $0 {mac|nvim {debian|ubuntu}}"
		exit 1
		;;
	esac
}

main "$@"
