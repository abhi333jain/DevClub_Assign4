#!/bin/bash

if [ ! -r $1 ]
then
  exit -1
fi
counter=0
for  val in $1/*
do
  if [ ! -d $val ]
  then
    if [[ $val == *$2 ]]; then
    let " counter++ "
    fi
  fi
done
echo $counter
