#!/bin/sh

SYSTEM=`uname -a`

if [[ $SHELL == "/bin/sh" ]]; then
  source ~/.bash/phi-bashrc

elif [[ $SYSTEM =~ .*k1om.* ]]; then
  source ~/.bash/phi-bashrc

elif [[ $SYSTEM =~ .*Darwin.* ]]; then
  source ~/.bash/osx-bashrc

else
  source ~/.bash/linux-bashrc

fi
