#!/usr/bin/env bash
# #!/bin/bash
if [ $# -eq 0 ]
then
   echo ""
   echo ""
   echo "Usage: $0.sh "
   echo "Work under working directory."
   echo "by Le CHEN, (chenle02@gmail.com)"
   echo "Mon 21 Dec 2020 07:19:04 PM EST"
   echo ""
   echo ""
   exit 1
fi


for i in 5 6 7 9 10 11 12 13
do
  echo "Chapter ... Number $i"
  ./CompileChapter.sh $i
done
