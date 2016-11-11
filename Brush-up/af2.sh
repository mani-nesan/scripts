#!/bin/bash

#Grading Script

#Script created by Andrew Fletcher, Darryl Sabin and Samuel Bates 

#This BASH script is designed to capture the users input and convert it into a
#alphabetical grade.

#The -n will prompt you for your input on the same line as the last command. 


#Prompts user for input, saves it as variable "grade"
echo -ne "\033[1mPlease type in your grade: \033[0m"
	read grade

#While statement used for boundaries
while (( ($grade < 0) || ($grade >100) ))
	do
		echo -e "\033[1mCannot compute: \033[0mGrade must be between 0-100"
		echo -ne "\033[1mPlease type in a valid grade: \033[0m" #Asks for grade again
		read grade
done 

#Checks to see if the "grade" variable contains letters
if echo "$grade" | grep -q [[:alpha:]]
	then echo -e "\033[1mCannot Compute: \033[0mGrade cannot contain letters"

#Used to calculate grade
	elif (( $grade <= 49 ))
		then echo "$grade% = F" 
	elif (( $grade <= 59 ))
		then echo "$grade% = D"
	elif (( $grade <= 69 ))
		then echo "$grade% = C"
	elif (( $grade <= 79 ))
		then echo "$grade% = B"
	elif (( $grade <=100 ))
		then echo "$grade% = A"

#Used for any error not already covered
	else echo -e "\033[1mCannot compute: \033[0mUndefined error"
fi

