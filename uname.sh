#!/bin/bash
if [ $# != 2 ]||[ ! -r $1 ]
then
  exit -1
fi

egrep -n "^.*:.:[0-1500]:[0-1500]:.*:.*:.*$" $1 > checked.txt
egrep -n "^.*" $1 > in.txt
check=$(cmp checked.txt in.txt | wc -c)
 rm checked.txt in.txt
 if [ $check != 0 ]
 then
   exit -1
fi
while IFS=: read -r f1 f2 f3 f4 f5 f6 f7
do
  if [ $2 == $f1 ]
  then
    name=$f5
  fi
done < $1
echo $name
