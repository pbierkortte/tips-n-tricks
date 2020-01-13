#!/bin/bash
set -euo pipefail
IFS=$'\n\t'


################################################################################
#  Usage:  ./generate-username.sh
#     or:  ./generate-username.sh [Length]
#
#  Rational:
#    * At least 9 characters
#    * Default MaxLength = 16
#    * Random length unless specified
#    * Contain only digits and lowercase letters
#    * Start with a letter
#    * Contain aleast one number
#    * Avoid ambiguous characters "1","2","l","o"
#    * No repeated characters
#  
################################################################################


generate-username(){
  minLength="${1:-9}"
  maxLength="${1:-16}"
  length=`shuf -n1 -i ${minLength}-${maxLength}`
  wLength="$((length-2))"
  digit=`echo -n {0..9} | tr -d '12 ' | fold -w1`
  alpha=`echo -n {a..z} | tr -d 'lo ' | fold -w1`
  d=`shuf -e -n1 ${digit}`
  a=`shuf -e -n1 ${alpha}`
  word=`echo -n {a..z} {0..9} | tr -d "12lo$d$a " | fold -w1`
  w=`shuf -e -n${wLength} ${word}`
  z=`echo "${d}${w}" | fold -w1 | shuf`
  echo "$(echo "${a}${z}" | tr -d "\n")"
}


generate-username $@
