alias ls='ls --color=auto'

prompt_color() {
  echo "${COLOR_BROWN}"
}

for CONF in /etc/profile.d/*.sh; do
  [ -f "${CONF}" ] && source "${CONF}"
done
