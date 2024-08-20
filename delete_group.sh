#!/bin/bash

#Delete existing group from the system

delgrp=$(whiptail --inputbox "Enter Group Name:" 8 39 --title "Delete Group"  3>&1 1>&2 2>&3)
  if [ $? != 0 ] || [ -z $delgrp ]
  then echo "Canceling Operation..."
  exit 1
  fi

#check if group exists

if getent group $agrp  &>/dev/null ;then
    sudo groupdel $delgrp
      if [ $? -eq 0 ]; then
           whiptail --msgbox "Group $delgrp Deleted successfully." 8 42  --title "Added"
      else
           whiptail --msgbox "Faild to delete group $delgrp, Try again" 8 39 --title "Error"
      fi
else
     whiptail --msgbox "Group $mgrp doesn't exist" 8 39 --title "Error"
fi
