#!/bin/bash
#Useradd script

USER='devops';
DIR='/home/'$USER;
FILE='config.txt';

#Check if user exists
getent passwd $USER;

if [ $? == 0 ]
  then
    echo "User already exists, continuing";
  else
    echo "User does not exist, creating";

    #Add user
    useradd $USER;

    if [$? -eq 0 ]
      then
        echo "User added successfully";
      else
        echo "User add failed";
    fi
fi

echo;

#Check if file exists
if [ -f $DIR'/'$FILE ]
  then
    echo 'File already exists, continuing';
  else
    #Make file
    touch $DIR/$FILE;
    #Add contents
    echo "devops users only" >> $DIR/$FILE;
    echo 'File created, continuing';
fi;

echo;

#Check contents of file
CONTENTS=`cat $DIR'/'$FILE`;
STRING='devops users only';

if [ "$CONTENTS" == "$STRING" ]
  then
    echo "Contents are correct";
  else
    echo "Contents incorrect, correcting";
    echo $STRING > $DIR'/'$FILE;
fi

#Check ownership


