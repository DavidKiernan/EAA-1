#!/bin/bash

FREQUENCY=$1;
INTERVAL=$2;
TIMESTAMP=`date +%Y-%m-%d-%H:%M:%S`;
FILENAME="mpstat-data-$TIMESTAMP";
FILEOUTPUT=$FILENAME.dat;

echo;

#Run mpstat, Redirect to a file
echo "Running mpstat";
mpstat $FREQUENCY $INTERVAL > $FILEOUTPUT;
echo "Mpstat complete";
