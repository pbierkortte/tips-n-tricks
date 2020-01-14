#!/bin/bash
set -euo pipefail
IFS=$'\n\t'


################################################################################
#  Usage:  ./generate-username.sh
#     or:  ./generate-username.sh [FixedLength]
#
#  Rational:
#    * Start with a letter
#    * Contain aleast one number
#    * Default length random between 9 and 16 characters 
#    * Fixed length if argument specified
#    * No repeated characters, so max length of 32
#    * Contain only digits and lowercase letters
#    * Avoid ambiguous characters "i","l","o","z"
#
#  Test Examples:
#    $ seq 10 | xargs -Iz -P8 ./generate-username.sh   | sort
#    $ seq 10 | xargs -Iz -P8 ./generate-username.sh 2 | sort
#    $ seq 10 | xargs -Iz -P8 ./generate-username.sh 5 | sort
#
################################################################################


generate-username(){
  minLength="${1:-9}"
  maxLength="${1:-16}"
  avoid="iloz"
  length=`shuf -n1 -i ${minLength}-${maxLength}`
  wLength="$((length-2))"
  digit=`echo -n {0..9} | tr -d "${avoid} " | fold -w1`
  alpha=`echo -n {a..z} | tr -d "${avoid} " | fold -w1`
  d=`shuf -e -n1 ${digit}`
  a=`shuf -e -n1 ${alpha}`
  word=`echo -n {0..9} {a..z} | tr -d "${avoid}${d}${a} " | fold -w1`
  w=`shuf -e -n${wLength} ${word}`
  z=`echo "${d}${w}" | fold -w1 | shuf`
  echo "$(echo "${a}${z}" | tr -d "\n")"
}


generate-username $@
