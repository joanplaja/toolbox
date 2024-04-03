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

\+ : Mandatory key combination

\*: Optional key combination

### Buffers 

| key/command     | action description                                  |
|-----------------|-----------------------------------------------------|
| -  | - |

### Windows

| key/command     | action description                                  |
|-----------------|-----------------------------------------------------|
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


### File explorer commands ( leader + e)

| key/command     | action description                                  |
|-----------------|-----------------------------------------------------|
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

### Cursor

| key/command     | action description                                  |
|-----------------|-----------------------------------------------------|
|      |              |

### Copying

| key/command     | action description                                  |
|-----------------|-----------------------------------------------------|
| yyp     | copy current line to below                   |
