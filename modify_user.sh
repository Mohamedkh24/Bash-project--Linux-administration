#!/bin/bash

muser=$(whiptail --inputbox "Enter the username:" 8 39 --title "Modify User" 3>&2 2>&1 1>&3)
        if [ $? != 0 ] || [ -z $muser ]; then
            echo "Canceling Operation...."
            exit 1
        fi

#Check if the user exists
if id $muser &>/dev/null; then
   option=$(whiptail --title "Modify User" --menu "Choose an option" 20 40 10 \
        "1" "Change Username" \
        "2" "Change User ID" \
        "3" "Add User Info/comment" \
        "4" "Change Home Directory" \
        "5" "Change Login Shell" \
        "6" "Change Primary Group" \
        "7" "Add User to Secondary Group" \
        "8" "Back"  3>&2 2>&1 1>&3)

         #when user choose to cancle
      if [ $? != 0 ] || [ -z $muser ]; then
         echo "Canceling Operation...."
         exit 1
      fi

        #Modify cases
      case $option in
        "1")
            new_muser=$(whiptail --inputbox "Enter new username:" 8 39 --title "Change Username" 3>&2 2>&1 1>&3)
            sudo usermod -l $new_muser  $muser
               if [ $? -eq 0 ]; then
                     whiptail --msgbox "Username changed successfully." 8 42
               else
                     whiptail --msgbox "Faild to change username, Try again" 8 39 --title "Error"
               fi
            ;;
        "2")
            new_uid=$(whiptail --inputbox "Enter new User-ID:" 8 39 --title "Change UID" 3>&2 2>&1 1>&3)
            sudo usermod -u $new_uid  $muser
               if [ $? -eq 0 ]; then
                     whiptail --msgbox "User-ID changed successfully." 8 42
               else
                     whiptail --msgbox "Faild to change User-ID, Try again" 8 39 --title "Error"
               fi
            ;;
        "3")
            gecos=$(whiptail --inputbox "Enter Gecos Information :" 8 39 --title "Change Gecos" 3>&2 2>&1 1>&3)
            sudo usermod -c $gecos  $muser
               if [ $? -eq 0 ]; then
                     whiptail --msgbox "Gecos-info changed successfully." 8 42
               else
                     whiptail --msgbox "Faild to change Gecos-info, Try again" 8 39 --title "Error"
               fi
            ;;
        "4")
            new_HD=$(whiptail --inputbox "Enter New Home Directory :" 8 39 --title "Change Home Directory" 3>&2 2>&1 1>&3)
            sudo usermod -d $new_HD  $muser
               if [ $? -eq 0 ]; then
                     whiptail --msgbox "Home Directory changed successfully." 8 42
               else
                     whiptail --msgbox "Faild to change Home Directory, Try again" 8 39 --title "Error"
               fi
             ;;
        "5")
            new_sh=$(whiptail --inputbox "Enter New Login Shell :" 8 39 --title "Change Login Shell" 3>&2 2>&1 1>&3)
            sudo usermod -s $new_sh  $muser
               if [ $? -eq 0 ]; then
                     whiptail --msgbox "Login Shell changed successfully." 8 42
               else
                     whiptail --msgbox "Faild to change Login Shell, Try again" 8 39 --title "Error"
               fi
             ;;
        "6")
            new_grp=$(whiptail --inputbox "Enter New primary group :" 8 39 --title "Change Primary Grooup" 3>&2 2>&1 1>&3)
            sudo usermod -g $new_grp  $muser
               if [ $? -eq 0 ]; then
                     whiptail --msgbox "Primary Group changed successfully." 8 42
               else
                     whiptail --msgbox "Faild to change Primary group, Try again" 8 39 --title "Error"
               fi
             ;;
        "7")
            sec_grp=$(whiptail --inputbox "Enter Group Name :" 8 39 --title "Add user to group" 3>&2 2>&1 1>&3)
            sudo usermod -a -G $sec_grp  $muser
               if [ $? -eq 0 ]; then
                     whiptail --msgbox "User added successfully." 8 42
               else
                     whiptail --msgbox "Faild to add $muser to $sec_grp, Try again" 8 39 --title "Error"
               fi
             ;;
        "8")
      esac
else
       whiptail --msgbox "User $muser doesn't exist" 8 39 --title "Error"
fi

exec ./main_menu.sh
