#!/bin/bash

#Changing User Password

chuser=$(whiptail --inputbox "Enter the username:" 8 39 --title "Change Password" 3>&1 1>&2 2>&3)
 if [ $? != 0 ] || [ -z $chuser ]
  then echo "Canceling Operation..."
  exit 1
  fi

#check if user exists

if id $chuser &>/dev/null; then
           PASSWORD=$(whiptail --passwordbox "Enter the new password:" 8 39 --title "Change Password" 3>&1 1>&2 2>&3)
                   if [ $? != 0 ] || [ -z $PASSWORD ]; then
                         echo "Enter a valid password"
                         exit 1
                   else
                             echo "$chuser:$PASSWORD" | sudo chpasswd

                    fi
#Check if password changed

        if [ $? -eq 0 ]; then
            whiptail --msgbox "Password for $chuser changed successfully." 8 42
        else
            whiptail --msgbox "Faild to change the password, Try again" 8 39 --title "Error"
         fi
else
    whiptail --msgbox "User $chuser doesn't exist" 8 39 --title "Error"
fi

