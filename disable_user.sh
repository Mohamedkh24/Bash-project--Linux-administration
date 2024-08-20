#!/bin/bash

#Disable/Lock User Account

disuser=$(whiptail --inputbox "Enter the username:" 8 39 --title "Disable Account" 3>&1 1>&2 2>&3)
 if [ $? != 0 ] || [ -z $disuser ]
  then echo "Canceling Operation..."
  exit 1
  fi

#check if the user exists

if id $disuser &>/dev/null; then
   sudo usermod -L $disuser
   if [ $? -eq 0 ]; then
       whiptail --msgbox "User $disuser Disabled successfully." 8 42
    else
       whiptail --msgbox "Faild to Disable user $disuser, Try again" 8 39 --title "Error"
    fi
else
    whiptail --msgbox "User $disuser doesn't exist" 8 39 --title "Error"
fi

