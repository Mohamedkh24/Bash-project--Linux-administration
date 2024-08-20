#!/bin/bash

#Enable user account

enuser=$(whiptail --inputbox "Enter the username:" 8 39 --title "Enable Account" 3>&1 1>&2 2>&3)
 if [ $? != 0 ] || [ -z $enuser ]
  then echo "Canceling Operation..."
  exit 1
  fi

#check if the user exists

if id $muser &>/dev/null; then
   sudo usermod -U $enuser
   if [ $? -eq 0 ]; then
       whiptail --msgbox "User $enuser Enabled successfully." 8 42
    else
       whiptail --msgbox "Faild to Enable user $enuser, Try again" 8 39 --title "Error"
    fi
else
    whiptail --msgbox "User $enuser doesn't exist" 8 39 --title "Error"
fi
