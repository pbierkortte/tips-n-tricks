#!/bin/bash
set -euo pipefail
IFS=$'\n\t'


################################################################################
#  Usage:  ./generate-username.sh [LENGTH]
#
#  Rational:
#    * Minimalism
#    * Simplicity
#    * Alphanumeric
#    * Lowercase
#  
#  Test Examples:
#    $ seq 10 17 | xargs -I{} ./generate-username.sh
#    $ seq 10 17 | xargs -n1  ./generate-username.sh
#
################################################################################

generate-username(){
  n=`shuf -n1 -i 10-${1:-17}`
  size=`shuf -n1 -i 10-${n}`
  head -c20 /dev/urandom \
  | base32 \
  | tr [:upper:] [:lower:] \
  | tail -c${size}
}

generate-username $@
