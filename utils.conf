nth_field() {
  awk "{print \$$1}"
}

to_iso_time() {
  while [ -n "$1" ]; do
    ruby -e "require 'time'; puts Time.at($1 / 1000).utc.iso8601"
    shift
  done
}

flike() {
  local search path
  if [ -z "$2" ]; then
    search="$1"
    path=.
  else
    search="$2"
    path="$1"
  fi
  find "${path}" -iname "*${search}*"
}

..() {
  local times
  times=$(echo $1 | wc -c)
  for ((i = 1; i < $times ; i++)); do
    cd ..
  done
}

curlx() {
  curl $@ | tidy -q -xml -i
}
