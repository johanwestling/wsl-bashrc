# Changes working directory to windows user folder.
echo -e "\033[33m→\033[39m Changing to working directory"
cd /mnt/c/Users/$(cmd.exe /c "echo %USERNAME%" | tr -d '\r')