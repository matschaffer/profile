alias qt='o -a /Applications/QuickTime\ Player.app/'
alias mplayer="/Applications/MPlayer\ OS\ X\ 2.app/Contents/Resources/mplayer.app/Contents/MacOS/mplayer"

function quickEncode () {
  while [ "$1" != "" ]; do
    INPUT="$1"
    shift
    OUTPUT="`echo $INPUT | sed 's/\.[^.]*$/\.m4v/'`"
    FILESIZE="`BLOCKSIZE=1048576 du -s "$INPUT"`"

    nice HandBrakeCLI -i "$INPUT" -o "$OUTPUT" --crop 0:0:0:0 -X 640 -Y 480 -e x264 -S $FILESIZE -2 -T -P -x 'vbv_maxrate=4500:vbv_bufsize=3000:threads=auto:ref=6:subq=6:me=umh:no-fast-pskip=1:level=3.0:mixed-refs=1:merange=24:direct=auto:analyse=all:cabac=0'
  done
}