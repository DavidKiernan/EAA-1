#!/bin/bash

COMMAND="loadtest";
SYNTHF="synthetic.dat";
FILE="mp-out.out";

#Do loop
for i in {1..10}
  do
    #Remove file
    rm $SYNTHF

    #Run loadtest
    echo "Running loadtest";
	
    ./loadtest $i &
    echo "Running MPStat";

    #Run mpstat to a file
    mpstat 10 1 > $FILE

    # Kill process
    echo "Killing loadtest $PID";
    pkill loadtest;

    # Calculate C0
    COUNT=`wc -l $SYNTHF | cut -f1 -d' '`;
    echo "COUNT: $COUNT";

    # Get avg idle
    AVG=tail $FILE | awk 'END{print $NF}'

done


