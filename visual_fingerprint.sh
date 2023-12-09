#!/bin/bash

# Visual Fingerprint
# Inspired by the randomart image produced by ssh-keygen
# Creates a visual fingerprint of the file provided
#
# Example output:
# 
# Visual Fingerprint
#
#    ╔══════════╗
#    ║ o.(..Fk. ║
#    ║ .uI.d... ║
#    ║ ... Ij.| ║
#    ║ ..f..... ║
#    ╚══════════╝
#
# any_file.txt
#


echo
if [ -z $1 ]; then
	echo "Usage: $0 <file>"
    echo
fi
echo Visual Fingerprint
echo 
echo ╔══════════╗ | sed 's/^/   /'

openssl dgst -sha256 ${1:-$0} |
awk '{print $2}' |
xxd -r -p |
xxd -g0 -c8 |
cut -c29- |
sed 's/.*/   ║ & ║/'

echo ╚══════════╝ | sed 's/^/   /'
echo
echo ${1:-$0}
echo
