profile_push() {
  tar cf - --exclude=".git" --exclude="repository" -C "${HOME}" .profile.d | \
    ssh $1 "rm -rf .profile.d .profile .bashrc;
            mkdir .profile.d;
            tar xf -;
            ln -s .profile.d/init .profile"
}

link_dotfiles() {
  local dotfile path
  for dotfile in "${PROFILE_PATH}"/dotfiles/*; do
    path="${HOME}/.`basename ${dotfile}`"
    [ -e "${path}" ] && rm -ri "${path}"
    ln -s "${dotfile}" "${path}"
  done
}
