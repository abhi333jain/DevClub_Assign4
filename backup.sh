#!/bin/bash
sync ()
{
dir1=$(ls $1)
dir2=$(ls $2)
for file in $dir1;
do
 if [[ ! "$dir2" == *"$file"* ]]; then
     if [[ -f "$1/$file" ]]; then
     cp "$1/$file" "$2/$file"
     echo "$1/$file" | cut -d / -f 6-
     else
        mkdir "$2/$file"
        sync "$1/$file" "$2/$file"
     fi
 else
   if [[ -d "$1/$file" ]]; then
     sync "$1/$file" "$2/$file"
   fi
 fi
done
}
echo "Files copied from $1 to $2 are :"
sync $1 $2
echo "Files copied from $2 to $1 are :"
sync $2 $1
