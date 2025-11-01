#!/bin/bash

read -p 'Enter count: ' COUNT 

while [[ $COUNT -gt 0 ]]; do

   echo "---> Count: $COUNT"

   sleep 1

   COUNT=$((COUNT - 1))

done

echo "---> Done"

