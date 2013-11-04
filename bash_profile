#!/bin/sh

SYSTEM=`uname -a`

if [[ $SHELL == "/bin/sh" ]]; then
  source ~/.bash/phi-bash

elif [[ $SYSTEM =~ .*k1om.* ]]; then
  source ~/.bash/phi-bash

elif [[ $SYSTEM =~ .*Darwin.* ]]; then
  source ~/.bash/osx-bash

else
  source ~/.bash/linux-bash

fi
