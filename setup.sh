#!/bin/bash

bashrc_docker=""
bashrc_ip=""
bashrc_directory=""
bashrc_remove=""

while [ $# -gt 0 ]; do
	case "$1" in
		--docker)
      bashrc_docker="true"
      ;;

		--ip)
      bashrc_ip="true"
      ;;

		--directory)
      bashrc_directory="true"
      ;;

		--remove)
      bashrc_remove="true"
      ;;
  esac
	shift
done

bashrc_snippet_add(){
  local snippet_name="${1}"
  local snippet_content=""
  local snippet_comment="# wsl-setup-bashrc-${snippet_name}"
  local bashrc_file="$HOME/.bashrc"

  snippet_content="${snippet_comment}-start"
  snippet_content="${snippet_content}"$'\n'$(cat ./snippets/${snippet_name}.sh)
  snippet_content="${snippet_content}"$'\n'"${snippet_comment}-end"
  
  if grep -q "${snippet_comment}" "${bashrc_file}"; then
    echo -e "\033[33m→\033[39m Updating ${snippet_name} snippet in .bashrc"
    sed -i '/'"${snippet_comment}-start"'/,/'"${snippet_comment}-end"'/d' "${bashrc_file}"
  else
    # Add newline if needed.
    [[ -z $(tail -1 "${bashrc_file}" | tr -d '\040\011\012\015') ]] || echo "" >> "${bashrc_file}"
    
    echo -e "\033[33m→\033[39m Adding ${snippet_name} snippet to .bashrc"
  fi

  echo "${snippet_content}" >> "${bashrc_file}"

  if grep -q "${snippet_comment}" "${bashrc_file}"; then
    echo -e "  \033[32m●\033[39m Done"
  else
    echo -e "  \033[31m●\033[39m Fail"
  fi
}

bashrc_snippet_remove(){
  local snippet_name="${1}"
  local snippet_comment="# wsl-setup-bashrc-${snippet_name}"
  local bashrc_file="$HOME/.bashrc"
  
  if grep -q "${snippet_comment}" "${bashrc_file}"; then
    echo -e "\033[33m→\033[39m Removing ${snippet_name} snippet from .bashrc"
    sed -i '/'"${snippet_comment}-start"'/,/'"${snippet_comment}-end"'/d' "${bashrc_file}"
  else
    echo -e "\033[33m→\033[39m No ${snippet_name} snippet found in .bashrc"
  fi

  if ! grep -q "${snippet_comment}" "${bashrc_file}"; then
    echo -e "  \033[32m●\033[39m Done"
  else
    echo -e "  \033[31m●\033[39m Fail"
  fi
}

if [ -n "${bashrc_docker}" ]; then
  if [ -z "${bashrc_remove}" ]; then
    bashrc_snippet_add "docker"
  else
    bashrc_snippet_remove "docker"
  fi
fi

if [ -n "${bashrc_ip}" ]; then
  if [ -z "${bashrc_remove}" ]; then
    bashrc_snippet_add "ip"
  else
    bashrc_snippet_remove "ip"
  fi
fi

if [ -n "${bashrc_directory}" ]; then
  if [ -z "${bashrc_remove}" ]; then
    bashrc_snippet_add "directory"
  else
    bashrc_snippet_remove "directory"
  fi
fi