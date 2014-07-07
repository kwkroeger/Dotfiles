#!/bin/sh

SYSTEM=`uname -a`

if [[ $SYSTEM =~ .*k1om.* ]]; then
  source ~/.phi-bashrc

else
  source ~/.bashrc

fi
