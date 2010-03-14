ssh_key_upload() {
  local destination publicKey dotSsh authorizedKeys

  destination="$1"
  publicKey="${2:-$HOME/.ssh/id_rsa.pub}"

  dotSsh=".ssh"
  authorizedKeys=".ssh/authorized_keys"

  cat "$publicKey" | ssh "${destination}" "mkdir -p \$HOME/${dotSsh}; chmod 700 \$HOME/${dotSsh}; \
                                           cat >> \$HOME/${authorizedKeys}; chmod 600 \$HOME/${authorizedKeys}"
}

complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed 's/,.*//g' | sed 's/\[//g '| sed 's/\\]:[0-9]*//g' | uniq | grep -v "\["`;)" ssh
