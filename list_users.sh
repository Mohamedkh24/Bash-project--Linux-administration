#!/bin/bash

#List Users
#script to list all the users in the system

list=$(cut -d: -f1 /etc/passwd)
 whiptail --scrolltext  --msgbox "Users on the system:\n$list" 20 50 --title "List of Users"

