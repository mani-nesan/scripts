#!/bin/bash

#System Information Script

#Script created by Andrew Fletcher, Darryl Sabin and Samuel Bates

#This BASH script is designed to display specific system
#information simply and quickly.

#The order that the information is displayed has been altered
#from the original specification. This is to retain ease of
#reading and organisation.

#The \n will put a space above or below the current line,
#depending on where it is placed on the current line. The -n will
#display the output of the next command on the same line as the
#current one. The -e will enable the backslash to be interpreted.

#The \033 is an Ansi escape character (in octal).
#The *m alters character attributes (1=bold, 0=standard).


#First header group
echo -e "\033[1m----------GENERAL_INFORMATION----------\033[0m"

#Displays current hostname
echo -ne "\nHOSTNAME: "
	hostname

#Displays current date and time
echo -ne "\nCURRENT DATE AND TIME: "
	date

#Displays current directory
echo -ne "\nCURRENT DIRECTORY: "
	pwd

#Second header group
echo -e "\n\033[1m----------ADVANCED_INFORMATION----------\033[0m"

#Displays list of active users
echo -e "\nACTIVE USERS: "
	who

#Displays list of disk usage
echo -e "\nDISK USAGE: "
	df -h

#Displays location of bash shell
echo -ne "\nBASH SHELL LOCATION: "
	echo $SHELL

