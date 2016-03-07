#!/bin/bash

INTERVAL=$1;
DURATION=$2;

if [ "$INTERVAL" == "" ] || [ "$DURATION" == "" ]
  then
    echo "Invalid Parameters";
  else
    echo 
    echo "INTERVAL" $INTERVAL
    echo "DURATION" $DURATION
    mpstat $INTERVAL $DURATION
fi

