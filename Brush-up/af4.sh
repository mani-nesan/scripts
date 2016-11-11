#!/bin/bash

#Advanced File and Directory Script

#Script created by Andrew Fletcher, Darryl Sabin and Samuel Bates

#This script is an advanced version of the File and Directory
#Script
#Instead of prompting the user to enter a valid directory and
#filename to check, these are passed in as arguments when the
#script is run.
#The "head -n3" is to only show the first 3 lines of the file

if [ -n "$1" ] && [ -n "$2" ]
	then
		if [ -d "$1" ] && cd $1
			then
				if [ -f "$2" ]
					then echo -e "\033[1m----------DIRECTORY CHECK----------\033[0m"
					echo -e "\033[1m$2 EXISTS\033[0m"
					echo -e "\n\033[1m----------Preview of $2----------\033[0m\n"
					echo "--------------------"
					head -n3 $2
					echo "--------------------"
					else echo "$2 DOES NOT EXIST IN $1"
				fi
			
			else echo -e "\033[1m----------DIRECTORY CHECK----------\033[0m"
			echo "$1 is not a valid directory"
		fi
	
	else echo "Please enter a directory and a filename when invoking this script"
fi
