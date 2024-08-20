#!/bin/bash

#Modify an existing group

mgrp=$(whiptail --inputbox "Enter the group name:" 8 39 --title "Modify Group" 3>&2 2>&1 1>&3)
        if [ $? != 0 ] || [ -z $mgrp ]; then
            echo "Canceling Operation...."
            exit 1
        fi

#Check if the group exists

if getent group $mgrp &>/dev/null; then
   options=$(whiptail --title "Modify Group" --menu "Choose an option" 20 50 10 \
        "1" "Change Group Name" \
        "2" "Add Users to Group" \
        "3" "Remove Users from Group" \
        "4" "Back"  3>&2 2>&1 1>&3)

      #when user choose to cancle

      if [ $? != 0 ] || [ -z $mgrp ]; then
         echo "Canceling Operation...."
         exit 1
      fi
     #Modify Cases

     case $options in
       "1")
            new_grp=$(whiptail --inputbox "Enter new name for group $mgrp:" 8 39 3>&1 1>&2 2>&3)
                if [ $? = 0 ] && [ ! -z "$new_name" ]; then
                    sudo groupmod -n "$new_grp" "$mgrp"
                    whiptail --msgbox "Group $mgrp renamed to $new_grp succssfully ." 8 39
                else
                    echo "Invalid input for group name."
                fi
           ;;
       "2")
             users=$(whiptail --inputbox "Enter users to add to $mgrp (Separated by comma):" 8 39 3>&1 1>&2 2>&3)
                if [ $? = 0 ] && [ ! -z "$users" ]; then
                 sudo usermod -a -G $mgrp "$users"
                    whiptail --msgbox "Users $users have been added to group $mgrp successfully." 8 39
                else
                    echo "Invalid input for users."
                fi
           ;;
       "3")
             users=$(whiptail --inputbox "Enter users to remove from $mgrp (Separated by comma):" 8 39 3>&1 1>&2 2>&3)
                if [ $? = 0 ] && [ ! -z "$users" ]; then
                    for user in $(echo "$users" | tr "," " "); do
                        sudo gpasswd -d "$user" "$mgrp"
                    done
                  whiptail --msgbox "Users $users have been removed from group $mgrp." 8 39
                else
                  echo "Invalid input for users."
                fi
           ;;
       "4")
     esac
else
     whiptail --msgbox "Group $mgrp doesn't exist" 8 39 --title "Error"
fi
