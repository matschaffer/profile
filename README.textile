h1. My Bash Profile

This is the profile that I'm now using across a number of machines that I administer.  Most of the tricks I use are fairly general and could be reused by anyone.

h2. What's it look like?

!http://cloud.github.com/downloads/matschaffer/profile/diagram.png(Feature Diagram)!

h2. Usage

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

From here you can now put any @*.conf@ in @~/.profile.d@ and it'll get loaded in alphabetical order. You can also put conf files in @~/.profile.d/`uname`@ to get platform-specific configuration or @~/.profile.d/$USER@ to get user-specific configuration. The load order (defined in the @init@ file) is:

# .profile.d/init
# .profile.d/<notextile>*</notextile>.conf
# .profile.d/$USER/<notextile>*</notextile>.conf
# .profile.d/`uname`/<notextile>*</notextile>.conf
# .profile.d/$USER/`uname`/<notextile>*</notextile>.conf

h2. Features

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

h2. Planned features

* Tab completion for ssh hosts in Solaris/Ubuntu
* Single-command for SSH key distribution and profile distribution
