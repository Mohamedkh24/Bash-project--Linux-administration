#!/bin/bash

#Delete User

deluser=$(whiptail --inputbox "Enter the username:" 8 39 --title "Delete Account" 3>&1 1>&2 2>&3)
 if [ $? != 0 ] || [ -z $deluser ]
  then echo "Canceling Operation..."
  exit 1
  fi

#check if ser exists

if id $deluser &>/dev/null; then
   sudo userdel -r  $deluser
   if [ $? -eq 0 ]; then
       whiptail --msgbox "User $deluser Deleted successfully." 8 42
    else
       whiptail --msgbox "Faild to Delete user $deluser, Try again" 8 39 --title "Error"
    fi
else
    whiptail --msgbox "User $deluser doesn't exist" 8 39 --title "Error"
fi
