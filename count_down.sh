#!/bin/bash

read -p 'Enter count: ' COUNT 

while [[ $COUNT -gt 0 ]]; do

   echo "---> Count: $COUNT"

   sleep 1

   COUNT=$((COUNT - 1))

done

COUNT=0

while [[ $COUNT < 3 ]]; do
   COUNT=$((COUNT + 1))
   xterm &
done

echo "---> Done"

