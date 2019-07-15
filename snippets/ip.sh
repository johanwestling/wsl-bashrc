# Detects current WSL ip address.
wsl_ip(){
  echo $(ifconfig eth0 | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' | head -1)
}
echo -e "\033[32m●\033[39m IP: $(wsl_ip) (use wsl_ip to output ip at any time)"