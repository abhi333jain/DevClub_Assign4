#!/bin/bash
ans=0
while read -r num op
do
  # echo $num $op
   let " ans=$ans $op $num "
done < $1
echo $ans
