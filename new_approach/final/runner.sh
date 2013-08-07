#!/bin/bash
# Spawn Bot Runner
#ruby redo_bot.rb 23
for i in $(seq 0 1 127)
do
  #screen echo "Welcome $i times"
  screen -d -m ruby redo_bot.rb $i
done
