#!/bin/bash

cd pr
echo "| Package name | master | stable |"
echo "|--|--|--|"
count=0
for file in *
do
  [ "$file" == "NR" ] && continue
  [ "$file" == "MSG" ] && continue
  if [ $count == "0" ]; then
    name=$(echo $file | cut -f1 -d-)
    echo -n "| $name | "
  else
    echo -n "| "
  fi
  cat $file
  if [ $count == "0" ]; then
    echo -n " "
    count=1
  else
    echo " |"
    count=0
  fi
done
cd ..