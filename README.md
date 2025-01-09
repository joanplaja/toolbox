<div align="center">
  <h1>Toolbox</h1>
  <p>This repository contains all necessary tools that I usually use, such as Neovim configuration and my cheat command script.</p>
</div>

# Table of Contents

- [Cheat command](#cheat-command)
  - [Installation](#installation)
  - [Example](#example)
- [Neovim](#neovim)
  - [Installation](#installation-1)
  - [Key mappings](#key-mappings)
    - [Search](#search)
    - [Cursor](#cursor)
    - [Text manipulation](#text-manipulation)
    - [Copying](#copying)
    - [Programming](#programming)
    - [Buffers](#buffers)
    - [Windows](#windows)
    - [Terminal](#terminal)
    - [Files and folders](#files-and-folders)
    - [File explorer (neotree) commands](#file-explorer-neotree-commands)
    - [Tabs](#tabs)

# Cheat command

## Installation

This script is compatible with Unix-like operating systems (Linux, macOS) and requires `curl` to download the script. If `curl` is unavailable, you can use `wget` as an alternative:

With `curl`:
```
curl -o cheatsheet.sh https://raw.githubusercontent.com/joanplaja/toolbox/main/bin/cheatsheet.sh && source cheatsheet.sh
```

With `wget`:
```
wget -O cheatsheet.sh https://raw.githubusercontent.com/joanplaja/toolbox/main/bin/cheatsheet.sh && source cheatsheet.sh
```

To make the script permanently available, add it to your shell configuration file. For example:

In `~/.bashrc` (for Bash):
```
echo 'source /path/to/cheatsheet.sh' >> ~/.bashrc
```

In `~/.zshrc` (for Zsh):
```
echo 'source /path/to/cheatsheet.sh' >> ~/.zshrc
```

After updating the configuration file, reload it using:
```
source ~/.bashrc  # For Bash
source ~/.zshrc   # For Zsh
```

## Example

```
cheat

Usage: cheat {linux|git|redis|kubernetes|ssh|postgres|opensearch|mysql|jq|docker
|aws}
```

```
cheat redis

redis-cli -h HOST_NAME - Connecting with cli to redis
MONITOR - Realtime information about operations
INFO keyspace - Get databases and its information
SELECT database - Select a database to work on
KEYS * - List all keys on the current database
FLUSHDB - Delete all keys on the current database
```

# Neovim

Neovim template https://www.lazyvim.org/ adapted to my style.

## Installation

Mac:
```
curl -sSL https://raw.githubusercontent.com/joanplaja/toolbox/main/setup.sh | sh -s mac
```

Ubuntu:
```
curl -sSL https://raw.githubusercontent.com/joanplaja/toolbox/main/setup.sh | sh -s nvim ubuntu
```

Debian:
```
curl -sSL https://raw.githubusercontent.com/joanplaja/toolbox/main/setup.sh | sh -s nvim debian
```

## Key mappings

\+ : Mandatory key combination

\*: Optional key combination

### Search

| key/command     | action description                                  |
|-----------------|-----------------------------------------------------|
| leader + s + g    | Search on all files as a grep           |
| leader + f + f    | Find files by name           |

### Cursor

| key/command     | action description                                  |
|-----------------|-----------------------------------------------------|
| 0    | Start of line           |
| $    | End of line           |
| gg    | Beginning of file           |
| G   | End of file           |
| w   | Next word           |
| b   | Previous word           |

### Text manipulation

| key/command     | action description                                  |
|-----------------|-----------------------------------------------------|
| `%s/searchstring/replacestring/gc` | Search and replace the string |
| leader + s + p  | Search and replace on current file (leader + i: toggle ignore case) |
| 0 (first position) + gg (first line) + visual + G  | Select all |
| leader + s + A  | Select all |
| (visual mode) + leader + u/U  | Transform selection to lowercase/uppercase |
| (visual mode) + gsa + ( (,[,\"', .. ) | Add surrounding text hola -> (hola) |

### Copying

| key/command     | action description                                  |
|-----------------|-----------------------------------------------------|
| yyp     | Copy current line to below                   |

### Programming

| key/command     | action description                                  |
|-----------------|-----------------------------------------------------|
| leader + g + d  | Go to definition |
| K  | Hover to show information (ex. function description)   |

### Buffers

| Key/Command       | Action Description                                  |
|-------------------|-----------------------------------------------------|
| :ls               | List all open buffers                               |
| shift + h           | Previous buffer                         |
| shift + l           | Next buffer                   |
| leader + b + d (same as :bd) | Close the current buffer                            |
| :w                | Save changes to the current buffer                  |

### Windows

| key/command     | action description                                  |
|-----------------|-----------------------------------------------------|
| ctrl + w + (H|L) | Move current window to (left|right) window |
| leader + w + (h|j|k|l) | Move to (left|top|bottom|right) windows |

### Terminal

| key/command     | action description                                  |
|-----------------|-----------------------------------------------------|
| leader + t + (j|k|l) | Open terminal on (top|bottom|right) windows |

### Files and folders

| key/command     | action description                                  |
|-----------------|-----------------------------------------------------|
| leader + e   | Open file explorer                     |
| :edit $filename   | Creates/Opens files                     |
| leader + c + p  | Copy current file relative path  |

### File explorer (neotree) commands (leader + e)

| key/command     | action description                                  |
|-----------------|-----------------------------------------------------|
| s     | Split file vertically                     |
| shift + s     | Split file horizontal                     |
| a     | Add files and folders                     |
| c     | Copy                     |
| m     | Move   |
| o     | Order                     |
| i     | Info                     |
| shift + h     | Show hidden files                     |

### Tabs

| key/command     | action description                                  |
|-----------------|-----------------------------------------------------|
| tab * (h|l)     | Switch tab (left|right)                    |
| leader + b + d     | Delete tab                    |

