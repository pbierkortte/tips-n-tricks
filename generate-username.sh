#!/bin/bash
set -euo pipefail
IFS=$'\n\t'


############################################
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
#  
############################################


generate-username(){
  minLength="${1:-9}"
  maxLength="${1:-16}"
  length=$(shuf -n1 -i $minLength-$maxLength)
  wLength=$(( length - 2))
  w=$(shuf -er -n$wLength {a..z} {0..9} | tr -d '\n')
  d=$(shuf -er -n1 {0..9} | tr -d '\n')
  z=$(echo ${d}${w} | fold -w1 | shuf | tr -d '\n')
  a=$(shuf -er -n1 {a..z} | tr -d '\n')
  echo ${a}${z}
}
