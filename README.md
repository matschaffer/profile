My Bash Profile
===============

This is the profile that I'm now using across a number of machines that I administer.  Most of the tricks I use are fairly general and could be reused by anyone.

What's it look like?
--------------------

(Note, this is an old screenshot, needs updating)

!http://cloud.github.com/downloads/matschaffer/profile/diagram.png(Feature Diagram)!

Installation
------------

    curl http://github.com/matschaffer/profile/raw/install | bash

(Old instructions)

<pre>
# Go home
cd ~

# Clone mine or your own fork
git clone git://github.com/matschaffer/profile.git .profile.d

# All *.conf files are loaded alphabetically, so this will retain your original settings
mv .profile .profile.d/z_myoldsettings.conf

# .profile.d/init kicks off the whole thing
ln -s .profile.d/init .profile

# Make sure you don't have any .bash_profile or .bashrc hanging out which might override .profile
# and reload your profile
source .profile
</pre>

From here you can now put any `*.conf` in `~/.profile.d` and it'll get loaded in alphabetical order. You can also make directories that end in `.conf`. This profile will then load all the `.conf` files in that directory in order.

Additionally, if you need to have OS-specific configuration just put a folder in `.profile.d` or `.profile.d/core` with the name returned by `uname`. The profile checks `uname` when the shell loads and loads any `.conf` files or directories in the OS-specific folder.

Load order
----------

This profile loads `init` first, followed by all the `.conf` files in `.profile.d/core`, then any `.conf` files in `.profile.d`. This allows you to have any non-user-specific code in `core` and anything personal in `.profile.d`. If you want to keep your personal profile information in git, just include `core` as a submodule.

Features
--------

This list is not guaranteed to be comprehensive, but here are some of the major features included as of the last time this document was updated.

* Reactive prompt - includes date and exit code of last command and git branch.
* Tab Completion for Git and Subversion
* Tab completion for Rake, Maven 2 and Ant
* Tab completion for ssh hosts on OS X.
* Git aliases
* 'safeedit' function that makes a timestamped backup copy of a file before editing
* Basic java set up on solaris and Darwin
* Maven memory settings
* 'profile_push' function for pushing these files out to other servers
* 'link_dotfiles' command that will create symlinks for all the files listed in the dotfiles directory
* Auto setup of .foward file on Linux and Solaris
* Integration with "CDArgs":http://www.skamphausen.de/cgi-bin/ska/CDargs
* "Autojump":http://wiki.github.com/joelthelion/autojump/

Planned features
----------------

* Tab completion for ssh hosts in Solaris/Ubuntu
* Single-command for SSH key distribution and profile distribution

Contributing
------------

As noted in the LICENSE file. This is all MIT licensed code, so do what you will. But to make things easy for contributions please keep all stuff in core as generic as possible so others can merge it into their own forks. If you need any personal stuff (e.g., API Keys), keep that in a separate git repository that loads this repo as a submodule.