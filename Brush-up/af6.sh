#!/bin/bash

#User Management Script

#Script created by Andrew Fletcher, Darryl Sabin and Samuel Bates

#This script is designed to let the user add or remove users.

#"if" statements have been used to navigate through the various
#menus and will return appropriate error messages if needed.
#"while" statements have been used to keep the users choice
#within the valid margin.
#If the user is not running as root, the script will not run and
#will display a message saying why.

if [ "$(id -u)" != "0" ]; then
	echo -e "\033[1mYou must be the root user to run this script\033[0m"
		else echo -e "\033[1mRoot user confirmed\033[0m"
	echo -e "\n\033[1m-----USER MANAGEMENT-----\033[0m"
	echo -e "\nOptions are as follows:"
	echo -e "\n\033[1m1.\033[0m Create a new user"
	echo -e "\033[1m2.\033[0m Delete an existing user"
	echo -e "\033[1m3.\033[0m Quit"
	echo -ne "\nPlease type a number to make your choice from the list above: "
		read choiceone

		while (( ($choiceone < 1) || ($choiceone > 3) ))
			do
				echo -e "\033[1mCannot compute: Input was not a valid option\033[0m"
				echo -n "Please type a number to make your choice from the list above: "
				read choiceone
		done

	if (( $choiceone == 1 ))
		then echo -e "\n\033[1m-----Create a new user-----\033[0m"
		echo -ne "\nEnter a Username: "
			read user
		echo -e "\nAre you sure you want to create this user?"
		echo -e "\nUsername: $user"
		echo -e "\n\033[1m1.\033[0m Yes"
		echo -e "\033[1m2.\033[0m No"
		echo -ne "\nPlease type a number to make your choice from the list above: "
			read choicetwo

			while (( ($choicetwo < 1) || ($choicetwo > 2) ))
				do
					echo -e "\033[1mCannot compute:\033[0m Input was not a valid option"
					echo -n "Please type a number to make your choice from the list above: "
					read choicetwo
			done

			if (( $choicetwo == 1 ))
				then useradd $user
				passwd $user
				echo -e "\033[1m-----Closing-----\033[0m"
			elif (( $choicetwo == 2 ))
				then echo -e "\033[1m-----Closing-----\033[0m"
			fi

	elif (( $choiceone == 2 ))
		then echo -e "\n\033[1m-----Delete an existing user-----\033[0m"
			echo -e "\nExisting users:\n"
			cat /etc/passwd | grep -F :/bin/bash | cut -d: -f1
			echo -ne "\nPlease type the name of the user listed above which you wish to delete: "
				read tobedeleted

			echo -e "\nAre you sure you want to delete this user?: $tobedeleted"
			echo -e "\n\033[1m1.\033[0m Yes"
			echo -e "\033[1m2.\033[0m No"
			echo -ne "\nPlease type a number to make your choice from the list above: "
				read choicethree

				while (( ($choicethree < 1) || ($choicethree > 2) ))
					do
						echo -e "\033[1mCannot compute: Input was not a valid option\033[0m"
						echo -n "Please type a number to make your choice from the list above: "
						read choicethree
				done

			if (( $choicethree == 1 ))
				then echo -e "\n\033[1mWARNING: THIS ACTION CANNOT BE UNDONE\033[0m"
				echo -e "\nDo you wish to continue?"
				echo -e "\n\033[1m1.\033[0m Yes"
				echo -e "\033[1m2.\033[0m No"
				echo -ne "\nPlease type a number to make your choice from the list above: "
					read choicefour

					while (( ($choicefour < 1) || ($choicefour > 2) ))
						do
							echo -e "\033[1mCannot compute: Input was not a valid option\033[0m"
							echo -n "Please type a number to make your choice from the list above: "
							read choicefour
					done

				if (( $choicefour == 1 ))
					then userdel -r $tobedeleted
					echo -e "\033[1m-----Closing-----\033[0m"
				elif (( $choicefour == 2 ))
					then echo -e "\033[1m-----Closing-----\033[0m"
				fi

			elif (( $choicethree == 2 ))
				then echo -e "\033[1m-----Closing-----\033[0m"
			fi

	elif (( $choiceone == 3 ))
		then echo -e "\033[1m-----Closing-----\033[0m"
	fi
fi
