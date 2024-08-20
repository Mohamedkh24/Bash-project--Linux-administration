#!/bin/bash

#adding new group

agrp=$(whiptail --inputbox "Enter Group Name :" 8 39 --title "Add Group" 3>&1 1>&2 2>&3)
  if [ $? != 0 ] || [ -z $agrp ]
  then echo "Canceling Operation..."
  exit 1
  fi

#check if group exists

if getent group $agrp  &>/dev/null ;then
    whiptail --msgbox "Group $agrp already exists.\nChoose another group name." 8 39
else
    sudo groupadd $agrp

      #check if group is added
      if [ $? -eq 0 ]; then
           whiptail --msgbox "Group $agrp added successfully." 8 42  --title "Added"
      else
           whiptail --msgbox "Faild to add group $agrp, Try again" 8 39 --title "Error"
      fi
fi
