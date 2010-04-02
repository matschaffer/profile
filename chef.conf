function cook() {
  local provisioning
  provisioning="$HOME/code/provisioning"

  if [ -z "$1" ]; then
    sudo $(which chef-solo) -c "${provisioning}/config/solo.rb" -j "${provisioning}/config/local.json"
  else
    cd "${provisioning}" 
    spatula cook "$1.hoopla.net" "$1"
    cd -
  fi
}
