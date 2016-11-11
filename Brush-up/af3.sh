#!/bin/bash

#File and Directory Script
 
#Script created by Andrew Fletcher, Darryl Sabin and Samuel Bates

#This script is designed to allow a user to enter a directory and
#then verify that it exists.
#If the user enters a valid directory, the prompt will move to
#that directory.
#Once the script has verified that the directory exists they are
#then prompted to enter a filename to check that the file exits.
#The "head -n3" is to show only the first 3 lines of the file

#First header
echo -e "\033[1m----------DIRECTORY CHECK----------\033[0m"

#Prompts user for a directory
echo Please enter a directory:
	read DIR

#Checks if directory exits
if [ -d $DIR ]
	then cd $DIR
		echo -e "\033[1m$DIR EXISTS\033[0m"
		echo "Please enter a filename from $DIR:"
		read FILE
			if [ -f $FILE ]
				then echo -e "\n\033[1m----------PREVIEW OF $FILE----------\033[0m\n"
					echo "--------------------"
					head -n3 $FILE
					echo "--------------------"
				else echo -e "\033[1m$FILE DOES NOT EXIST IN $DIR\033[0m"
			fi
	else echo -e "\033[1mDIR DOES NOT EXIST\033[0m"
fi
