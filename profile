# -*- mode: sh -*-

for supplement in "${HOME}/profile-supplements"/* ; do
  . "${supplement}"
done
