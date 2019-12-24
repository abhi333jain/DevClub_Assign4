#!/bin/bash
# cat $1 | sed s/'<name\(*\)val="\(*\)"\(.*\)>$'/"<name\1val=\"$2\"\2>"/g>temp.txt
cat $1 | sed s/'^<name\(.*\)val=".*"\(.*\)>'/"<name\1val=\"$2\"\2>"/g > temp.txt
cat temp.txt > $1
rm temp.txt
