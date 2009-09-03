if [ "${TERM}" == "dumb" ]; then
  export COLOR_NONE=''
  export COLOR_WHITE=''
  export COLOR_BLACK=''
  export COLOR_BLUE=''
  export COLOR_LIGHT_BLUE=''
  export COLOR_GREEN=''
  export COLOR_LIGHT_GREEN=''
  export COLOR_CYAN=''
  export COLOR_LIGHT_CYAN=''
  export COLOR_RED=''
  export COLOR_LIGHT_RED=''
  export COLOR_PURPLE=''
  export COLOR_LIGHT_PURPLE=''
  export COLOR_BROWN=''
  export COLOR_YELLOW=''
  export COLOR_GRAY=''
  export COLOR_LIGHT_GRAY=''
else
  export COLOR_NONE='[0m'
  export COLOR_WHITE='[1;37m'
  export COLOR_BLACK='[0;30m'
  export COLOR_BLUE='[0;34m'
  export COLOR_LIGHT_BLUE='[1;34m'
  export COLOR_GREEN='[0;32m'
  export COLOR_LIGHT_GREEN='[1;32m'
  export COLOR_CYAN='[0;36m'
  export COLOR_LIGHT_CYAN='[1;36m'
  export COLOR_RED='[0;31m'
  export COLOR_LIGHT_RED='[1;31m'
  export COLOR_PURPLE='[0;35m'
  export COLOR_LIGHT_PURPLE='[1;35m'
  export COLOR_BROWN='[0;33m'
  export COLOR_YELLOW='[1;33m'
  export COLOR_GRAY='[1;30m'
  export COLOR_LIGHT_GRAY='[0;37m'
fi

# From http://pastie.org/144897
colors() {
	T='gYw'   # The test text
	echo -e "\n                 40m     41m     42m     43m\
     44m     45m     46m     47m";

	for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
	           '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
	           '  36m' '1;36m' '  37m' '1;37m'; do
	  FG=${FGs// /}
	  echo -en " $FGs \033[$FG  $T  "
	  for BG in 40m 41m 42m 43m 44m 45m 46m 47m; do
    	echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
  	done
	  echo
	done
	echo
}
