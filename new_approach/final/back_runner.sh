#!/bin/bash
# Spawn Bot Runner
#ruby redo_bot.rb 23
for i in $(seq 130 1 200)
do
  #echo "Welcome $i times"
  screen -d -m ruby redo_bot.rb $i
done
