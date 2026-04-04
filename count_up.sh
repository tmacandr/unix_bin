#!/bin/bash

read -p 'Enter Max Count: ' MAX_COUNT 

COUNT=0

while [[ $COUNT -lt $MAX_COUNT ]]; do

   echo "---> Count: $COUNT"

   sleep 1

   COUNT=$((COUNT + 1))

done

echo "---> Done"

