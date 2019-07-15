# Autostarts docker service.
! service docker status | \
  grep -n 'is running' > /dev/null && \
  echo -e "\033[33m→\033[39m Starting docker service"; \
  service docker start > $