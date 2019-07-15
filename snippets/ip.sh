# Detects current WSL ip address.
export wsl_ip=$(ifconfig eth0 | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' | head -1)
echo -e "\033[32m●\033[39m IP: ${wsl_ip} (use wsl_ip environment variable at any time)"