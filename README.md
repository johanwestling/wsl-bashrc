# WSL 2 ~/.bashrc snippets

Various snippets to add to the end of your WSL 2 ```~/.bashrc```.

## How to edit
```bash
nano ~/.bashrc
```
_Exit with **CTRL + X**, confirm or discard your changes with **Y** or **N** key followed by **ENTER** key_

## Snippets

```bash
# Change default working directory
echo -e "\033[33m→\033[39m Changing default working directory"
cd /mnt/c/Users/Whatever/folder/you/like
```

```bash
# Start docker service if not running.
! service docker status | grep -n 'is running' > /dev/null && echo -e "\033[33m→\033[39m Starting docker service"; service docker start > $
```
