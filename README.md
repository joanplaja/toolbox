# Mac Setup

```
curl -sSL https://raw.githubusercontent.com/joanplaja/toolbox/main/setup.sh | sh -s mac
```

# Cheat command

## Installation

```
curl -o cheatsheet.sh https://raw.githubusercontent.com/joanplaja/toolbox/main/bin/cheatsheet.sh && source cheatsheet.sh
 ```

## Example

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

### Standalone

Ubuntu:
```
 curl -sSL https://raw.githubusercontent.com/joanplaja/toolbox/main/setup.sh | sh -s nvim ubuntu
 ```
 Debian:
```
 curl -sSL https://raw.githubusercontent.com/joanplaja/toolbox/main/setup.sh | sh -s nvim debian
 ```

### Docker

## key mappings

brew install gnu-sed add with ansible ( used for search and replace)

copilot needs node install version
from: https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating
nvm install 16
Copilot auth ( to setup )
then ready

\+ : Mandatory key combination

\*: Optional key combination

### Search 

| key/command     | action description                                  |
|-----------------|-----------------------------------------------------|
|  leader + s + g    |   Search on all files as a grep           |
|  leader + f + f    |   Find files by name           |


### Cursor

| key/command     | action description                                  |
|-----------------|-----------------------------------------------------|
|  0    |   Start of line           |
|  $    |   End of line           |
|  gg    |   Beginning of file           |
|  G   |   End of file           |
|  w   |   Next word           |
|  b   |   Previous word           |

### Text manipulation 

| key/command     | action description                                  |
|-----------------|-----------------------------------------------------|
| `%s/searchstring/replacestring/gc` | Search and replace the string |
| leader + s + p  | Search and replace on current file (leader + i: toggle ignore case) |
| 0 (first position) + gg (first line) + visual + G  | Select all |
| leader + s + A  | Select all |
| (visual mode) + leader + u/U  | Transform selection to lowercase/uppercase |
| (visual mode) + gsa + ( (,[,",' .. ) | Add surronding text hola -> (hola) | 


### Copying

| key/command     | action description                                  |
|-----------------|-----------------------------------------------------|
| yyp     | copy current line to below                   |


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
| leader + b + d ( same as :bd )               | Close the current buffer                            |
| :w                | Save changes to the current buffer                  |

### Windows

| key/command     | action description                                  |
|-----------------|-----------------------------------------------------|
|  ctrl + w + (H|L) | Move current window to (left|right) window |
|  leder + w + (h\|j\|k\|l) | Move to (left\|top\|bottom\|right) windows |

### Terminal

| key/command     | action description                                  |
|-----------------|-----------------------------------------------------|
|  leder + t + (j\|k\|l) | Open terminal on (top\|bottom\|right) windows |


### Files and folders

| key/command     | action description                                  |
|-----------------|-----------------------------------------------------|
|  leader + e   | Open file explorer                     |
|  :edit $filename   | Creates/Opens files                     |
| leader + c + p  | Copy current file relative path  |


### File explorer (neotree) commands ( leader + e)

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
| tab * (h\|l)     | Switch tab (left\|right)                    |
| leader + b + d     | Delete tab                    |
