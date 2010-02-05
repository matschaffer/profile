export TERM=xterm
export JAVA_HOME=/usr
export PATH="$PATH:/opt/csw/bin:/usr/local/mysql/bin"

# Usually I need a handful of local installations of apps
for APP in "${HOME}/apps/"*; do
  export PATH="${PATH}:${APP}/bin"
done

# Joyent servers are little different
if [ "`hostname | cut -d. -f2`x" = "joyentx" ]; then
  export MAIL=/usr/mail/${LOGNAME:?}
  export PATH=/opt/local/bin:/opt/local/sbin:/usr/xpg4/bin:/usr/bin:/usr/sbin:/usr/sfw/bin:/usr/openwin/bin:/opt/SUNWspro/bin:/usr/ccs/bin:/usr/openwin/bin
  export PKG_PATH=http://pkgsrc.joyent.com/2007Q4/All
fi

prompt_color() {
  echo "${COLOR_LIGHT_PURPLE}"
}