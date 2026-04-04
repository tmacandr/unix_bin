#!/bin/bash

COUNT=0

while [[ $COUNT -gt -1 ]]; do

   echo "---> Count: $COUNT"

   sleep 1

   COUNT=$((COUNT + 1))

done

echo "---> Done"

