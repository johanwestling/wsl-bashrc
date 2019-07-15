# Autostarts docker service.
wsl_docker(){
  if ! service docker status | grep -n 'is running' > /dev/null; then
    echo -e "\033[33m→\033[39m Docker service is starting"; \
    service docker start > /dev/null
  else
    echo -e "\033[32m●\033[39m Docker service already running"; \
  fi
}
wsl_docker