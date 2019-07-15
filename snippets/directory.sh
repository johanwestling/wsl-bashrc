# Changes to default working directory of current Windows user.
wsl_root(){
  local directory="/${1}"
  echo -e "\033[33m→\033[39m Changing to default working directory... (use wsl_root to return at any time)"
  cd /mnt/c/Users/$(cmd.exe /c "echo %USERNAME%" | tr -d '\r')${directory}
}
wsl_root