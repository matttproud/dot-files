################################################################################
# Matt T. Proud's UNIX Dot (.) Files and Configurations                        #
#                                                                              #
# You are free to use these as you wish, except for I request that you provide #
# attribution as well as a canonical link back to their source.                #
#                                                                              #
# - http://www.matttproud.com                                                  #
# - http://blog.matttproud.com                                                 #
# - https://github.com/matttproud                                              #
#                                                                              #
################################################################################
#
# -*- mode: sh -*-

for supplement in "${HOME}/Development/shell/dot-files/profile-supplements"/* ; do
  . "${supplement}"
done

if [ -f "${HOME}/.dircolors" ]; then
   eval $(dircolors ~/.dircolors)
fi
