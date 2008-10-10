#!/bin/sh

# (C) 2002-2003 Dan Allen and Stefan Kamphausen

# Written by Dan Allen <dan@mojavelinux.com>
# - small additions by Stefan Kamphausen
# - better completion code by Robi Malik robi.malik@nexgo.de

# Globals
CDARGS_SORT=0   # set to 1 if you want mark to sort the list
CDARGS_NODUPS=1 # set to 1 if you want mark to delete dups

# --------------------------------------------- #
# Run the cdargs program to get the target      #
# directory to be used in the various context   #
# This is the fundamental core of the           #
# bookmarking idea.  An alias or substring is   #
# expected and upon receiving one it either     #
# resolves the alias if it exists or opens a    #
# curses window with the narrowed down options  #
# waiting for the user to select one.           #
#                                               #
# @param  string alias                          #
#                                               #
# @access private                               #
# @return void                                  #
# --------------------------------------------- #
function _cdargs_get_dir ()
{
    # if there is one exact match, then just use
    # that match without calling cdargs
    if [[ -e $HOME/.cdargs && `grep -c "^$1 " $HOME/.cdargs` == 1 ]]; then
        dir=`grep "^$1 " $HOME/.cdargs | sed "s/.* \(.*\)/\1/"`;
    # okay, we need cdargs to resolve this one, 
    # if we had a substring param, then force program window to come up
    else
        cdargs --noresolve "$1" && \
        dir=`cat "$HOME/.cdargsresult"` && \
        rm -f "$HOME/.cdargsresult";
    fi
}

# --------------------------------------------- #
# Perform the command (cp or mv) using the      #
# cdargs bookmark alias as the target directory #
#                                               #
# @param  string command argument list          #
#                                               #
# @access private                               #
# @return void                                  #
# --------------------------------------------- #
function _cdargs_exec ()
{
    local arg dir i last call_with_browse

    # Get the last option which will be the bookmark alias
    eval last=\${$#};

    # Resolve the bookmark alias.  If it cannot resolve, the
    # curses window will come up at which point a directory
    # will need to be choosen.  After selecting a directory,
    # the function will continue and $_cdargs_dir will be set.
	if [ -e $last ]; then
	  last=""
    fi
    _cdargs_get_dir "$last";
    # For each argument save the last, move the file given in
    # the argument to the resolved cdargs directory
    i=1;
    for arg; do
        if [ $i -lt $# ]; then
            $command "$arg" "$dir";
        fi
        let i=$i+1;
    done
}

# --------------------------------------------- #
# Prepare to move file list into the cdargs     #
# target directory                              #
#                                               #
# @param  string command argument list          #
#                                               #
# @access public                                #
# @return void                                  #
# --------------------------------------------- #
function mvb ()
{
    local command

    command='mv -i';
    _cdargs_exec $*;
}

# --------------------------------------------- #
# Prepare to copy file list into the cdargs     #
# target directory                              #
#                                               #
# @param  string command argument list          #
#                                               #
# @access public                                #
# @return void                                  #
# --------------------------------------------- #
function cpb ()
{
    local command

    command='cp -i';
    _cdargs_exec $*;
}

# --------------------------------------------- #
# Change directory to the cdargs target         #
# directory                                     #
#                                               #
# @param  string alias                          #
#                                               #
# @access public                                #
# @return void                                  #
# --------------------------------------------- #
function cdb () 
{ 
    local dir

    _cdargs_get_dir "$1" && cd "$dir" && echo `pwd`;
}
alias cb='cdb'
alias cv='cdb'

# --------------------------------------------- #
# Mark the current directory with alias         #
# provided and store as a cdargs bookmark       #
# directory                                     #
#                                               #
# @param  string alias                          #
#                                               #
# @access public                                #
# @return void                                  #
# --------------------------------------------- #
function mark () 
{ 
    local tmpfile

    # first clear any bookmarks with this same alias, if file exists
    if [[ "$CDARGS_NODUPS" && -e $HOME/.cdargs ]]; then
        tmpfile=`echo ${TEMP:-${TMPDIR:-/tmp}} | sed -e "s/\\/$//"`
        tmpfile=$tmpfile/cdargs.$USER.$$.$RANDOM
        grep -v "^$1 " $HOME/.cdargs > $tmpfile && 'mv' -f $tmpfile $HOME/.cdargs;
    fi
    # add the alias to the list of bookmarks
    cdargs --add=":$1:`pwd`"; 
    # sort the resulting list
    if [ "$CDARGS_SORT" ]; then
        sort -o $HOME/.cdargs $HOME/.cdargs;
    fi
}
# Oh, no! Not overwrite 'm' for stefan! This was 
# the very first alias I ever wrote in my un*x 
# carreer and will always be aliased to less...
# alias m='mark'

# --------------------------------------------- #
# Mark the current directory with alias         #
# provided and store as a cdargs bookmark       #
# directory but do not overwrite previous       #
# bookmarks with same name                      #
#                                               #
# @param  string alias                          #
#                                               #
# @access public                                #
# @return void                                  #
# author: SKa                                   #
# --------------------------------------------- #
function ca ()
{
    # add the alias to the list of bookmarks
    cdargs --add=":$1:`pwd`"; 
}

# --------------------------------------------- #
# Bash programming completion for cdargs        #
# Sets the $COMPREPLY list for complete         #
#                                               #
# @param  string substring of alias             #
#                                               #
# @access private                               #
# @return void                                  #
# --------------------------------------------- #
function _cdargs_aliases ()
{
    cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=()
    COMPREPLY=( $( (echo $cur ; cat $HOME/.cdargs) | \
                   awk 'BEGIN {first=1}
		        {if (first) {cur=$0; l=length(cur); first=0}
                         else if (substr($1,1,l) == cur) {print $1}}' ) )

    return 0
}

complete -F _cdargs_aliases cv cb cdb
