#!/bin/bash

#Creating New User

auser=$(whiptail --inputbox "Enter the username:" 8 39 --title "Add User" 3>&1 1>&2 2>&3)
  if [ $? != 0 ] || [ -z $auser ]
  then echo "Canceling Operation..."
  exit 1
  fi

  #check if the user exists and create password

    if id $auser &>/dev/null ;then
       whiptail --msgbox "User $adduser already exists.\nChoose another username." 8 39
    else
       PASSWORD=$(whiptail --passwordbox "Enter the password:" 8 39 --title "User Creation" 3>&1 1>&2 2>&3)
          if [ $? != 0 ] || [ -z $PASSWORD ]
          then echo "Enter a valid password"
          exit 1
          fi

  #create the user and set the password

     sudo useradd $auser
     echo "$auser:$PASSWORD" | sudo chpasswd

  #check if the user is created

      if [ $? -eq 0 ]; then
              whiptail --msgbox "User $auser added successfully." 8 42  --title "Added"
      else
              whiptail --msgbox "Faild to add user $auser, Try again" 8 39 --title "Error"
      fi
  fi
