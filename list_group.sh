#!/bin/bash

#listing all groups in the system

listgrp=$(cut -d: -f1  /etc/group)
 whiptail --scrolltext  --msgbox "Groups on the system:\n$listgrp" 20 50 --title "List of Users"
