#!/bin/bash

#Main Menu
while true; do
   Choice=$(whiptail --title "User & Group Management" --menu "Choose an option" 0 0 0 \
    "List Users"           "List all users in the system" \
    "Add User"             "Add a user to the system" \
    "Modify User"          "Modify an existing user" \
    "Enable User"          "Unlock the user account" \
    "Disable User"         "Lock the user account" \
    "Change Password"      "Change the password of the user" \
    "Delete User"          "Delete an existing user" \
    "List Groups"    "List all groups in the system" \
    "Add Group"      "Add a user group to the system" \
    "Modify Group"   "Modify a group and its list of members" \
    "Delete Group"   "Delete an existing group" \
    "About"          "Information about this program" \
    "Exit"           "Close the program" 3>&2  2>&1 1>&3)

#when user choose to cancle

if [ $? != 0 ]; then
   echo "Canceling Operation..."
   exit 1
fi

#Cases

  case $Choice in
    "List Users") ./list_users.sh ;;
    "Add User") ./add_user.sh ;;
    "Modify User") ./modify_user.sh ;;
    "Enable User") ./enable_user.sh ;;
    "Disable User") ./disable_user.sh ;;
    "Change Password") ./change_pass.sh ;;
    "Delete User") ./delete_user.sh ;;
    "List Groups") ./list_group.sh ;;
    "Add Group") ./add_group.sh ;;
    "Modify Group") ./modify_group.sh ;;
    "Delete Group") ./delete_group.sh ;;
    "About") ./about.sh ;;
    "Exit")     exit 1 ;;
     *)         echo "Invalid Choice" ;;
  esac
done

